import re
import sqlite3

from flask import Flask, g, render_template
from jinja2 import evalcontextfilter, Markup, escape

DATABASE = "content.sqlite"

_paragraph_re = re.compile(r'(?:\r\n|\r|\n){2,}')
app = Flask(__name__)


@app.route("/")
def index():
    chapters = []
    for chapter in query("""
         SELECT title, nid, replace(body_value, '\\r\\n', '\r\n') AS body
         FROM node
         JOIN field_data_body body ON body.entity_id = nid
         WHERE type = 'page'
         ORDER BY NOT title LIKE 'mods.de%', title LIKE '%.php', title"""):
        chapter["params"] = query("""
             SELECT title, replace(body_value, '\\r\\n', '\r\n') AS body, field_method_value AS method
             FROM node
             JOIN field_data_body body ON node.nid = body.entity_id
             JOIN field_data_field_method method ON node.nid = method.entity_id
             JOIN nodehierarchy_menu_links lut USING(nid)
             JOIN menu_links child USING (mlid)
             JOIN menu_links parent ON parent.mlid = child.plid AND parent.link_title = ?""", [chapter["title"]])
        chapters.append(chapter)
    return render_template("doc.html", chapters=chapters)


@app.before_request
def before_request():
    g.db = sqlite3.connect(DATABASE)
    g.db.row_factory = lambda cursor, row: dict((cursor.description[idx][0], value) for idx, value in enumerate(row))


@app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()


def query(query, args=(), one=False):
    cur = g.db.execute(query, args)
    rv = cur.fetchall()
    cur.close()
    return (rv[0] if rv else None) if one else rv


@app.template_filter()
@evalcontextfilter
def nl2br(eval_ctx, value):
    result = u'\n\n'.join(u'<p>%s</p>' % p.replace('\n', '<br>\n') \
        for p in _paragraph_re.split(escape(value)))
    if eval_ctx.autoescape:
        result = Markup(result)
    return result

if __name__ == "__main__":
    app.run(debug=True)
