
--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_config'
--

/*CREATE TABLE IF NOT EXISTS 'field_config' (
  'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  'field_name' varchar NOT NULL ,
  'type' varchar NOT NULL ,
  'module' varchar NOT NULL default '' ,
  'active' tinyint(4) NOT NULL default '0' ,
  'storage_type' varchar NOT NULL ,
  'storage_module' varchar NOT NULL default '' ,
  'storage_active' tinyint(4) NOT NULL default '0' ,
  'locked' tinyint(4) NOT NULL default '0' ,
  'data' longblob NOT NULL ,
  'cardinality' tinyint(4) NOT NULL default '0',
  'translatable' tinyint(4) NOT NULL default '0',
  'deleted' tinyint(4) NOT NULL default '0'
);

--
-- Daten für Tabelle 'mdexmldocs_field_config'
--

INSERT INTO 'field_config' ('id', 'field_name', 'type', 'module', 'active', 'storage_type', 'storage_module', 'storage_active', 'locked', 'data', 'cardinality', 'translatable', 'deleted') VALUES
(1, 'comment_body', 'text_long', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0, 1, 0, 0),
(2, 'body', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0, 1, 0, 0),
(3, 'field_tags', 'taxonomy_term_reference', 'taxonomy', 0, 'field_sql_storage', 'field_sql_storage', 1, 0, 0, -1, 0, 0),
(4, 'field_image', 'image', 'image', 0, 'field_sql_storage', 'field_sql_storage', 1, 0, 0, 1, 0, 0),
(5, 'field_method', 'list_text', 'list', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_config_instance'
--

CREATE TABLE IF NOT EXISTS 'field_config_instance' (
  'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  'field_id' INTEGER NOT NULL ,
  'field_name' varchar NOT NULL default '',
  'entity_type' varchar NOT NULL default '',
  'bundle' varchar NOT NULL default '',
  'data' longblob NOT NULL,
  'deleted' tinyint(4) NOT NULL default '0'
);

--
-- Daten für Tabelle 'mdexmldocs_field_config_instance'
--

INSERT INTO 'field_config_instance' ('id', 'field_id', 'field_name', 'entity_type', 'bundle', 'data', 'deleted') VALUES
(1, 1, 'comment_body', 'comment', 'comment_node_page', 0, 0),
(2, 2, 'body', 'node', 'page', 0, 0),
(3, 1, 'comment_body', 'comment', 'comment_node_article', 0, 0),
(4, 2, 'body', 'node', 'article', 0, 0),
(5, 3, 'field_tags', 'node', 'article', 0, 0),
(6, 4, 'field_image', 'node', 'article', 0, 0),
(7, 1, 'comment_body', 'comment', 'comment_node_parameter', 0, 0),
(8, 2, 'body', 'node', 'parameter', 0, 0),
(9, 5, 'field_method', 'node', 'parameter', 0, 0);
*/
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_data_body'
--

CREATE TABLE IF NOT EXISTS 'field_data_body' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  default NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'body_value' longtext,
  'body_summary' longtext,
  'body_format' varchar default NULL
);

--
-- Daten für Tabelle 'mdexmldocs_field_data_body'
--

INSERT INTO 'field_data_body' ('entity_type', 'bundle', 'deleted', 'entity_id', 'revision_id', 'language', 'delta', 'body_value', 'body_summary', 'body_format') VALUES
('node', 'page', 0, 1, 1, 'und', 0, 'Hier gehts um die möglichen Queries (Anfragen), die die eigentliche Funktionalität der XML API stellen.\r\nAlle Dateien der XML API liegen im Ordner http://forum.mods.de/bb/xml/, allerdings muss man hin und wieder (z.B. zum Anmelden) auch auf andere Pfade zugreifen). Parameter werden meistens per GET übergeben.\r\nDas ausgegebene XML hält sich an <a href="http://forum.mods.de/bb/forum.xsd">dieses XML-Schema</a>.', '', 'filtered_html'),
('node', 'page', 0, 2, 2, 'und', 0, 'Gibt alle vom angemeldeten Benutzer gesetzten Bookmarks zurück.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<bookmarks newposts="6" count="2">\r\n  <bookmark BMID="92071" newposts="6" PID="1242999267">\r\n    <thread TID="194906" closed="0" pages="325">\r\n      <![CDATA[Hardware-Kaufberatung]]>\r\n    </thread>\r\n    <board BID="10">\r\n      <![CDATA[Hardware & Netzwerk]]>\r\n    </board>\r\n  </bookmark>\r\n  <bookmark BMID="95504" newposts="0" PID="1242999854">\r\n    <thread TID="140831" closed="0" pages="5525">\r\n      <![CDATA[Gehirnsalat]]>\r\n    </thread>\r\n    <board BID="43">\r\n      <![CDATA[Webdesign & Coding]]>\r\n    </board>\r\n  </bookmark>\r\n</bookmarks>\r\n</xml>\r\n\r\n<ul>\r\n    <li>bookmarks ist das root-Element. <br />\r\n        newposts ist die Anzahl der neuen Posts<br />\r\n        count ist die Anzahl der Lesezeichen\r\n        <ul>\r\n            <li>bookmark ist ein einzelnes Lesezeichen<br />\r\n                BMID ist die Bookmark-ID<br />\r\n                newposts ist die Anzahl der neuen Posts<br />\r\n                PID ist die Posting-ID des letztens Posts\r\n                <ul>\r\n                    <li>thread<br />\r\n                        TID ist die Thread-ID<br />\r\n                        closed ob der Thread geschlossen ist<br />\r\n                        pages die Anzahl der Seite<br />\r\n                        Inhalt ist der Titel des Threads\r\n                    </li>\r\n                    <li>board (optional)<br />\r\n                        BID ist die Board-ID<br />\r\n                        Inhalt der Name des Boards\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'page', 0, 3, 3, 'und', 0, 'Um sich einzuloggen reicht es die folgende Kombination an Parametern zu senden;>\r\nMan kann dann recht einfach nachschauen, ob es geklappt hat, wenn man die zurückgegebene Seite\r\nnach dem String "Fehler beim Einloggen" durchsucht. Es kommen Cookies zurück, die man speichern\r\nmuss und bei folgenden Aufrufen wieder an den Server schicken sollte, benutzt man CURL <a href="http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTCOOKIEFILE">kann das\r\nCURL für einen erledigen</a>.\r\nDie Addresse des Logins lautet http://login.mods.de/', '', 'filtered_html'),
('node', 'parameter', 0, 4, 4, 'und', 0, 'Enthält den Benutzernamen', '', 'filtered_html'),
('node', 'parameter', 0, 5, 5, 'und', 0, 'Enthält das Passwort (Klartext).', '', 'filtered_html'),
('node', 'parameter', 0, 6, 6, 'und', 0, 'Gibt an wie lange die Session gültig sein wird, in Sekunden.\r\nÜbliche Werte: <ul><li>3600: Eine Stunde</li>\r\n<li>86400: Ein Tag</li>\r\n<li>604800: Eine Woche</li>\r\n<li>31536000: Ein Jahr</li>\r\n</ul>', '', 'filtered_html'),
('node', 'page', 0, 7, 7, 'und', 0, 'Zum Ausloggen reicht es einen einfachen Request an http://login.mods.de/logout/ abzusetzen.\r\nJetzt kommt das aber: Es gibt einen Sicherungsmechanismus, man muss ein Sicherheitstoken übergeben.\r\n\r\nBei Misserfolg kommt einfach eine leere Seite zurück, bei erfolgtem Ausloggen enthält die Seite den Text "Du hast dich ausgeloggt".', '', 'filtered_html'),
('node', 'parameter', 0, 8, 8, 'und', 0, 'Die User-ID', '', 'filtered_html'),
('node', 'parameter', 0, 9, 9, 'und', 0, 'Der Sicherheitstoken. Der Sicherheitstoken besteht aus 4 Buchstaben oder Zahlen und bleibt über eine ganze Session konstant.\r\nEs gibt keine Möglichkeit über eine schnicke XML-API sich das Sicherheitstoken ausgeben zu lassen.\r\nAm einfachsten kommt man also dran, indem man sich eine beliebige Seite vom Forum ausgeben lässt und den Logout-Link sucht und das Token extrahiert.', '', 'filtered_html'),
('node', 'page', 0, 10, 10, 'und', 0, 'Gibt eine Liste aller Foren zurück.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?> \r\n<categories  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="1224901" count="9">\r\n  <category id="6">\r\n    <name>\r\n      <![CDATA[Allgemeines]]>\r\n    </name>\r\n    <description>\r\n      <![CDATA[Seitenübergreifende Themen]]>\r\n    </description>\r\n    <boards count="4">\r\n      <board id="95">\r\n        <name>\r\n          <![CDATA[3DSupply.de]]>\r\n        </name>\r\n        <description>\r\n          <![CDATA[Alles rund um 3D Supply]]>\r\n        </description>\r\n        <number-of-threads value=''451'' />\r\n        <number-of-replies value=''22040'' />\r\n        <in-category id="6" />\r\n        <lastpost>\r\n          <post>\r\n            <user id="1241980">\r\n              <![CDATA[Chinakohl mit Reis]]>\r\n            </user>\r\n            <date timestamp="1311972627">29.07.2011 22:50:27\r\n            </date>\r\n            <in-thread id="171342">\r\n              <![CDATA[3DSupply Produktfragen]]>\r\n            </in-thread>\r\n            <in-board id="95" />\r\n          </post>\r\n        </lastpost>\r\n        <moderators>\r\n          <user id="2822">\r\n            <![CDATA[Insaniac]]>\r\n          </user>\r\n        </moderators>\r\n      </board>\r\n    </boards>\r\n  </category>\r\n</categories>\r\n</xml>\r\n\r\n<ul>\r\n    <li>categories ist das root-Element.\r\n        current-user-id ist die User-ID des angemeldeten Benutzers\r\n        count ist die Anzahl der Kategorien\r\n        <ul>\r\n            <li>category repräsentiert eine Kategorie\r\n                id ist die Category-ID\r\n                <ul>\r\n                    <li>name</li>\r\n                    <li>description</li>\r\n                    <li>boards\r\n                        count Anzahl\r\n                        <ul>\r\n                            <li>board\r\n                                <ul>\r\n                                    <li>name</li>\r\n                                    <li>desription</li>\r\n                                    <li>number-of-threads\r\n                                        value Anzahl</li>\r\n                                    <li>number-of-replies\r\n                                        value Anzahl</li>\r\n                                    <li>in-category\r\n                                        id Die Category-ID (Könnte das womöglich redundant sein?)</li>\r\n                                    <li>lastpost\r\n                                        <ul>\r\n                                            <li>post\r\n                                                <ul>\r\n                                                    <li>user\r\n                                                        id User-ID\r\n                                                        Inhalt ist der Name</li>\r\n                                                    <li>date\r\n                                                        timestamp ist der UNIX-Zeitstempel\r\n                                                        Inhalt ist ein vorformatiertes Datum im Format DD.MM.YYYY HH:MM:SS</li>\r\n                                                    <li>in-thread\r\n                                                        id ist die Thread-ID\r\n                                                        Inhalt ist der Titel</li>\r\n                                                    <li>in-board\r\n                                                        id ist die Board-ID</li>\r\n                                                </ul>\r\n                                            </li>\r\n                                        </ul>\r\n                                    </li>\r\n                                    <li>moderators\r\n                                        <ul>\r\n                                            <li>user\r\n                           
                     id ist die User-ID</li>\r\n                                        </ul>\r\n                                    </li>\r\n                                </ul>\r\n                            </li>\r\n                        </ul>\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'page', 0, 11, 11, 'und', 0, 'Das hier ist die inoffizielle Dokumentation der XML Schnittstelle des mods.de Forums. Aktuell gibt es keine offizielle Dokumentation, deswegen versuche ich hier möglichst alle Funktionen zentral zu dokumentieren und möglichst ausführlich zu beschreiben.\r\nWenn was fehlt oder hier was falsches stehen sollte, wäre es nett, einen Kommentar zu hinterlassen oder mir im Forum eine <a href="http://my.mods.de/csde_rats">PM zu schreiben</a>.\r\n\r\nHave Fun!', '', 'filtered_html'),
('node', 'page', 0, 12, 12, 'und', 0, 'Die thread.php ist für die Ausgabe von Threads mitsamt Posts zuständig.\r\nGerüchteweise ist es irgendwie möglich die Ausgabe auf einen Post zu beschränken bzw. die Anzahl der Auszugebenden Posts zu verändern. Wie dies gemacht wird ist derzeit jedoch unbekannt.\r\nNormalerweise wird eine vollständige Seite (30 Posts) oder, wenn es nicht soviele Posts gibt, so viele Posts ausgegeben, bis es keine Posts mehr zum Ausgeben gibt. Anders gesagt ist data(/thread/posts/@count) nie größer als 30.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<thread xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="1224901" id="140831">  \r\n  <title>    \r\n    <![CDATA[Gehirnsalat]]>\r\n  </title>    \r\n  <subtitle>      \r\n    <![CDATA[wir unter uns]]>\r\n  </subtitle>      \r\n  <number-of-replies value=''165797'' />      \r\n  <number-of-hits value=''5767761'' />      \r\n  <flags>        \r\n    <is-closed value="0" />        \r\n    <is-sticky value="0" />        \r\n    <is-important value="0" />        \r\n    <is-announcement value="0" />        \r\n    <is-global value="0" />      \r\n  </flags>      \r\n  <in-board id="43" />      \r\n  <firstpost>        \r\n    <post>          \r\n      <user id="19602">            \r\n        <![CDATA[TriggerTG]]>\r\n      </user>            \r\n      <date timestamp="1149182655">01.06.2006 19:24:15\r\n      </date>            \r\n      <in-thread id="140831" />            \r\n      <in-board id="43" />          \r\n    </post>        \r\n  </firstpost>\r\n  <posts page="5528" offset="165810" count="1">                         \r\n    <post id="1243000252">                    \r\n      <user id="1224901" group-id="3">                      \r\n        <![CDATA[csde_rats]]>\r\n      </user>                      \r\n      <date timestamp="1312055567">30.07.2011 21:52:47\r\n      </date>                      \r\n      <message>                        \r\n        <edited count="2">                          \r\n          <lastedit>                            \r\n            <user id="1224901">                              \r\n              <![CDATA[csde_rats]]>\r\n            </user>                              \r\n            <date timestamp="1312055985">30.07.2011 21:59:45\r\n            </date>                            \r\n          </lastedit>                          \r\n        </edited>                          \r\n        <content>                            \r\n          <![CDATA[So ich hab mal angefangen: [URL]http://mde-xml.docs.enkore.de/[/URL] *Le Fu: Muss noch kurz dem werten Gast Rechte geben *erledigt]]>\r\n        </content>                            \r\n        <title>\r\n        </title>                          \r\n      </message>                          \r\n      <avatar id="59224">                            \r\n        <![CDATA[./avatare/german.gif]]>\r\n      </avatar>                            \r\n      <in-thread id="140831">                              \r\n        <![CDATA[Gehirnsalat]]>\r\n      </in-thread>                              \r\n      <in-board id="43" />                            \r\n    </post>                                                                                                                                                                                                            \r\n  </posts>                                                                                                                                                                              \r\n</thread>\r\n</xml>\r\n\r\n<ul>\r\n	<li>thread (root)\r\n    	current-user-id ist die User-ID\r\n        id ist die Thread-ID\r\n		<ul>\r\n        	<li>title\r\n            	Inhalt ist der Threadtitel</li>\r\n        	<li>subtitle\r\n            	Inhalt ist der Untertitel</li>\r\n            <li>number-of-replies\r\n            	value ist die Anzahl der Antworten</li>\r\n            <li>number-of-hits\r\n            	
value ist die Anzahl der Aufrufe</li>\r\n            <li>flags\r\n            	(0=Nein, 1=Ja)\r\n            	<ul>\r\n                	<li>is-closed\r\n                    	value gibt an, ob geschlossen</li>\r\n                    <li>is-sticky\r\n                    	value gibt an, ob angepinnt</li>\r\n                    <li>is-important\r\n                    	value gibt an, ob als wichtig markiert</li>\r\n                    <li>is-announcement\r\n                    	value gibt an, ob als Ankündigung markiert</li>\r\n                    <li>is-global\r\n                    	value gibt an, ob der Thread global (in allen Foren sichtbar) ist</li>\r\n                </ul>\r\n          	</li>\r\n            <li>in-board\r\n            	id ist die Board-ID</li>\r\n            <li>firstpost\r\n            	<ul>\r\n                	<li>user\r\n                    	id ist die User-ID\r\n                        Inhalt der Name</li>\r\n                   	<li>date\r\n                    	timestamp ist ein UNIX-Zeitstempel\r\n                        Inhalt ist ein vorformatiertes Datum</li>\r\n                   	<li>in-thread\r\n                    	id ist die Thread-ID</li>\r\n                    <li>in-board\r\n                    	id ist die Board-ID</li>\r\n           		</ul>\r\n            </li>\r\n            <li>posts\r\n            	page ist die Seite (es werden nie Posts von mehreren Seiten ausgegeben)\r\n                offset die Nummer des ersten Posts auf der Seite (nicht die Post-ID)\r\n                count ist die Anzahl der enthaltenen Elemente (hier 1, weil ich das Beispiel gekürzt habe)\r\n            	<ul>\r\n                	<li>post\r\n                    	id ist die Post-ID\r\n                        <ul>\r\n                        	<li>user\r\n                            	id ist die User-ID\r\n                                group-id ist die Group-ID\r\n                                Inhalt der Name\r\n                            </li>\r\n                            <li>date\r\n                                timestamp ist ein UNIX-Zeitstempel\r\n                                Inhalt ist ein vorformatiertes Datum</li>\r\n                            <li>message\r\n                            	<ul>\r\n                                	<li>edited\r\n                                    	count ist die Anzahl der Bearbeitungen\r\n                                        <ul>\r\n                                        	<li>lastedit\r\n                                                <ul>\r\n                                                    <li>user\r\n                                                        id ist die User-ID\r\n                                                        group-id ist die Group-ID\r\n                                                        Inhalt der Name</li>\r\n                                                    <li>date\r\n                                                        timestamp ist ein UNIX-Zeitstempel\r\n                                                        Inhalt ist ein vorformatiertes Datum</li>\r\n                                                </ul>\r\n                                             </li>\r\n                                        </ul>\r\n                                    </li>\r\n                                    <li>content\r\n                                    	Inhalt ist der Posttext (unprocessed, enthält also BB-Code, Smilies etc. als Plaintext). Es sind <strong>keine</strong> Zeilenumbrüche enthalten.</li>\r\n                                    <li>title\r\n                                    	Inhalt ist der Posttitel, optional</li>\r\n                                </ul>\r\n                            </li>    \r\n                            <li>avatar\r\n                            	id ist die Avatar-ID\r\n                                Inhalt der Dateiname mit der Basis http://forum.mods.de/bb/</li>\r\n                            <li>in-thread\r\n                                id ist die Thread-ID\r\n                              
  Inhalt der Name</li>\r\n                            <li>in-board\r\n                                id ist die Board-ID</li>\r\n                        </ul>\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'parameter', 0, 13, 13, 'und', 0, 'Die Thread-ID des auszugebenden Threads.\r\nWenn keine Thread mit dieser ID existiert oder keine TID angegeben wurde, bekommt man lediglich ein <xml><invalid-thread/></xml> zurück.', '', 'full_html'),
('node', 'parameter', 0, 14, 14, 'und', 0, 'PID gibt eine Post-ID für einen Post an, der auf jeden Fall in der Ausgabe enthalten ist.\r\nWenn in dem Thread kein Post mit dieser ID vorhanden ist, wird die erste Seite zurückgegeben.', '', 'filtered_html'),
('node', 'parameter', 0, 15, 15, 'und', 0, 'Gibt die auszugebende Seite an.\r\nWenn der Thread nicht soviele Seiten hat, hat das Posts-Tag keine Kinder: <xml><posts page="6700000" offset="200999970" count="0"/></xml>\r\n', '', 'full_html'),
('node', 'parameter', 0, 16, 16, 'und', 0, 'Der temp-Parameter wird beim Erstellen eines Posts übergeben um Caching zu verhindern.\r\nStandardmäßig wird hier einfach der aktuelle Timestamp (z.B. 1312117403) übergeben.\r\nHauptsache den Wert gabs vorher nicht....', '', 'filtered_html'),
('node', 'parameter', 0, 17, 17, 'und', 0, 'Gibt die Anzahl der am Anfang zu überspringenden Posts an.\r\nEs wird, sofern der Thread genug Posts hat, immer exakt mit dem offset-ten Post angefangen und von da an bis zum Threadende oder maximal 30 Posts ausgegeben.\r\nWenn der Thread nicht genug Posts hat, kommt ähnliches wie bei Page zurück: <xml><posts offset="89999999999" count="0"/></xml>', '', 'full_html'),
('node', 'page', 0, 18, 18, 'und', 0, 'Wenn ihr auch eine Applikation gebastelt habt, die die API verwendet, könnt ihr einfach einen Kommentar schreiben und ich trags dann hier ein! ;)\r\n\r\n<ul>\r\n<li><a href="http://code.google.com/p/potdroid/">potdroid App für Android</a></li>\r\n<li><a href="http://kamelstall.de/bb/client/">JQuery Client</a></li>\r\n</ul>', '', 'full_html'),
('node', 'parameter', 0, 19, 19, 'und', 0, 'Wenn onlyPID gesetzt ist, wird nur das Posting mit dieser Posting-ID ausgegeben. Dadurch entfällt <strong>nicht</strong> die Angabe der TID.', '', 'filtered_html'),
('node', 'parameter', 0, 20, 20, 'und', 0, 'Wenn update_bookmark 1 ist (Standard: 0), dann wird das Lesezeichen auf den letzten ausgegeben Post verschoben (wie bei der normalen Threadanzeige also)', '', 'filtered_html'),
('node', 'page', 0, 21, 21, 'und', 0, 'Die board.php gibt Infos zu einem Board mit bekannter Board-ID (siehe dazu <a href="/docs/boards.php">boards.php</a>) inklusive einer Threadliste aus.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<board xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="1224901" id="43">\r\n  <name>\r\n    <![CDATA[Webdesign & Coding]]>\r\n  </name>\r\n  <description>\r\n    <![CDATA[Hello World!]]>\r\n  </description>\r\n  <number-of-threads value="4497"/>\r\n  <number-of-replies value="220990"/>\r\n  <in-category id="21"/>\r\n  <threads with-stickies="1" with-globals="1" page="1" offset="0" count="30">\r\n    <thread id="189020">\r\n      <title>\r\n        <![CDATA[Aktualisierte Forensatzung]]>\r\n      </title>\r\n      <subtitle>\r\n        <![CDATA[vom 28.09.08]]>\r\n      </subtitle>\r\n      <number-of-replies value="0"/>\r\n      <number-of-hits value="45239"/>\r\n      <number-of-pages value="1"/>\r\n      <flags>\r\n        <is-closed value="1"/>\r\n        <is-sticky value="1"/>\r\n        <is-important value="1"/>\r\n        <is-announcement value="1"/>\r\n        <is-global value="1"/>\r\n      </flags>\r\n      <in-board id="14"/>\r\n      <firstpost>\r\n        <post>\r\n          <user id="2822">\r\n            <![CDATA[Insaniac]]>\r\n          </user>\r\n          <date timestamp="1222589113">28.09.2008 10:05:13 \r\n          </date>\r\n          <in-thread id="189020"/>\r\n          <in-board id="14"/>\r\n        </post>\r\n      </firstpost>\r\n    </thread>\r\n  </threads>\r\n</board>\r\n</xml>\r\n\r\n<ul>\r\n	<li>board\r\n    	current-user-id User-ID\r\n        id Board-ID\r\n        <ul>\r\n        	<li>name</li>\r\n            <li>description</li>\r\n            <li>number-of-threads\r\n            	value ist die Anzahl der Threads im Board</li>\r\n            <li>number-of-replies\r\n            	value ist die Anzahl aller Antworten</li>\r\n            <li>in-category\r\n            	id ist die Category-ID</li>\r\n            <li>threads\r\n            	with-stickies spiegelt den Parameter wieder\r\n                with-globals ebenso\r\n                page ist die Seite\r\n                offset ist die Anzahl der am Anfang übersprungenen Threads\r\n                count die Anzahl der Threads dieser Seite\r\n                <ul>\r\n                	<li>thread\r\n                    	id ist die Thread-ID\r\n                        <ul>\r\n                            <li>title\r\n                                Inhalt ist der Threadtitel</li>\r\n                            <li>subtitle\r\n                                Inhalt ist der Untertitel</li>\r\n                            <li>number-of-replies\r\n                                value ist die Anzahl der Antworten</li>\r\n                            <li>number-of-hits\r\n                                value ist die Anzahl der Aufrufe</li>\r\n                            <li>flags\r\n                                (0=Nein, 1=Ja)\r\n                                <ul>\r\n                                    <li>is-closed\r\n                                        value gibt an, ob geschlossen</li>\r\n                                    <li>is-sticky\r\n                                        value gibt an, ob angepinnt</li>\r\n                                    <li>is-important\r\n                                        value gibt an, ob als wichtig markiert</li>\r\n                                    <li>is-announcement\r\n                                        value gibt an, ob als Ankündigung markiert</li>\r\n                                    <li>is-global\r\n                                        value gibt an, ob der Thread global (in allen Foren sichtbar) ist</li>\r\n                                </ul>\r\n                            </li>\r\n                            <li>in-board\r\n                                id ist die Board-ID</li>\r\n                            <li>firstpost\r\n  
                              <ul>\r\n                                    <li>user\r\n                                        id ist die User-ID\r\n                                        Inhalt der Name</li>\r\n                                    <li>date\r\n                                        timestamp ist ein UNIX-Zeitstempel\r\n                                        Inhalt ist ein vorformatiertes Datum</li>\r\n                                    <li>in-thread\r\n                                        id ist die Thread-ID</li>\r\n                                    <li>in-board\r\n                                        id ist die Board-ID</li>\r\n                                </ul>\r\n                            </li>\r\n                        </ul>\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'parameter', 0, 22, 22, 'und', 0, 'Anzahl der am Anfang zu überspringenden Threads', '', 'filtered_html'),
('node', 'parameter', 0, 23, 23, 'und', 0, 'Wenn with-globals 1 ist (Standard ist auch 1), dann werden auch globale Threads ausgegeben, ansonsten nicht.', '', 'filtered_html'),
('node', 'parameter', 0, 24, 24, 'und', 0, 'Wenn with-stickies 1 ist (Standard ist auch hier ebenfalls 1), dann werden Stickies ausgegeben, ansonsten... nicht ;)', '', 'filtered_html'),
('node', 'page', 0, 25, 25, 'und', 0, 'Eigentlich ist das relativ nutzlos, da sich das vermutlich eh nie ändern wird... ;D\r\nIch glaube ich brauche hier nichts wirklich zu schreiben, praktisch alle Angaben hieraus kann man auch hardcoden. (Henne-Ei-Problem: Wenn ich settings.php aufrufe um den Basispfad (/settings/base-url) herauszufinden, woher habe ich ihn denn dann ;) )\r\n\r\n<blockquote cite="enos">Es gibt übrigens auch noch eine xml/settings.php, die bisher nirgends verwendet wird und die ich, soweit ich mich erinnern kann, auch noch nirgends verlinkt habe - vermutlich, weil sie ziemlich nutzlos ist - enos</blockquote>\r\n\r\n<xml title="Ausgabe (konstant)">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<settings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="0">\r\n  <flags>\r\n    <allow-dynamic-images value="0"/>\r\n    <is-online value="1"/>\r\n  </flags>\r\n  <forum-title>\r\n    <![CDATA[mods.de - Forum]]>\r\n  </forum-title>\r\n  <base-url>\r\n  <![CDATA[http://forum.mods.de/bb]]>\r\n  </base-url>\r\n  <base-url-banners>\r\n  <![CDATA[http://forum.mods.de/bb/img/head/]]>\r\n  </base-url-banners>\r\n  <banner>\r\n    <![CDATA[banner-mde.jpeg]]>\r\n  </banner>\r\n  <replies-per-page>30 \r\n  </replies-per-page>\r\n  <threads-per-page>30 \r\n  </threads-per-page>\r\n</settings>\r\n</xml>\r\n', '', 'full_html'),
('node', 'parameter', 0, 26, 26, 'und', 0, 'Die Board-ID zu der man Informationen abfragen möchte.\r\nWenn es kein Board mit dieser ID gibt, kommt ein <xml><invalid-board/></xml> zurück.', '', 'full_html'),
('node', 'page', 0, 27, 27, 'und', 0, 'Das hier ist nicht direkt Teil der XML API, sondern der POST-Schnittstelle, aber da wir schonmal hier sind ;)\r\nDer Pfad zum Skript lautet http://forum.mods.de/bb/newreply.php\r\n\r\nAblauf:\r\n<ol>\r\n<li>newreply mit der gewünschten TID als GET-Parameter abrufen</li>\r\n<li>Das token rausfriemeln. Dafür bietet sich ein Regex an.</li>\r\n<li>Alle Felderchen brav ausfüllen und abschicken</li>\r\n</ol>\r\n\r\n<strong>Beachte:</strong> Es ist kein multipart/form-data Formular, sondern ein ganz normales!', '', 'filtered_html'),
('node', 'parameter', 0, 28, 28, 'und', 0, 'Die Thread-ID zu der der Post gehören soll', '', 'filtered_html'),
('node', 'parameter', 0, 29, 29, 'und', 0, 'Die Session-ID, aber nur, wenn man sie <strong>nicht</strong> per Cookie übermittelt. Also nie.', '', 'filtered_html'),
('node', 'parameter', 0, 31, 31, 'und', 0, 'token ist ein Sicherheitstoken um Leute wie uns (nein, nicht wirklich ;) ) draußenzuhalten. Es wird vermutlich intern zur Verarbeitung des Aufrufs benötigt und wird uns von der Seite schon fertig ausgeliefert: <xml><input type="hidden" name="token" value="b5c7ad552bcd7063656b7b2fac1ae6eb"></xml>', '', 'full_html'),
('node', 'parameter', 0, 32, 32, 'und', 0, 'Der Name sagt alles, der Titel des Posts.', '', 'filtered_html'),
('node', 'parameter', 0, 33, 33, 'und', 0, 'Nachrichteninhalt. Maximallänge: 15.000 Bytes bzw. rund 15 KB', '', 'filtered_html'),
('node', 'parameter', 0, 34, 34, 'und', 0, 'Wenn dieser Parameter übertragen wird und 1 ist, werden [URL]-Tags automatisch eingefügt', '', 'filtered_html'),
('node', 'parameter', 0, 35, 35, 'und', 0, 'Wenn dieser Parameter übertragen wird und 1 ist, wird BB-Code für diesen Post deaktiviert', '', 'filtered_html'),
('node', 'parameter', 0, 36, 36, 'und', 0, 'Wenn dieser Parameter übertragen wird und 1 ist, werden keine Smilies erzeugt', '', 'filtered_html'),
('node', 'parameter', 0, 37, 37, 'und', 0, 'Sollte "Eintragen" als Wert haben. Ich weiß nicht ob das überprüft wird, aber es ist definitv cleaner.', '', 'filtered_html'),
('node', 'parameter', 0, 38, 38, 'und', 0, 'Das Icon des Posts.\r\nMögliche Werte:\r\n<ul>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon2.gif" alt="Icon" />: 32</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon11.gif" alt="Icon" />: 40</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon4.gif" alt="Icon" />: 34</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon3.gif" alt="Icon" />: 33</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon12.gif" alt="Icon" />: 41</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/thumbsup.gif" alt="Icon" />: 2</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/thumbsdown.gif" alt="Icon" />: 1</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/pfeil.gif" alt="Icon" />: 54</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon8.gif" alt="Icon" />: 38</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon5.gif" alt="Icon" />: 35</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon9.gif" alt="Icon" />: 28</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon13.gif" alt="Icon" />: 42</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon6.gif" alt="Icon" />: 36</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon10.gif" alt="Icon" />: 39</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon7.gif" alt="Icon" />: 37</li>\r\n<li>Kein Icon: 0</li>\r\n</ul>', '', 'full_html'),
('node', 'page', 0, 39, 39, 'und', 0, 'Da sich der Ablauf und die Parameter sehr ähneln, verweise ich für weitere Informationen auf <a href="/docs/newreply.php">newreply.php</a> und beschränke mich hier auf die Unterschiede.\r\n\r\nUnterschiede im Ablauf:\r\nAnstelle der TID wird die BID (Board-ID) übergeben.', '', 'filtered_html'),
('node', 'parameter', 0, 40, 40, 'und', 0, 'Thread Titel', '', 'filtered_html'),
('node', 'parameter', 0, 41, 41, 'und', 0, 'Thread Untertitel', '', 'filtered_html'),
('node', 'parameter', 0, 42, 42, 'und', 0, 'Thread Tags', '', 'filtered_html'),
('node', 'parameter', 0, 43, 43, 'und', 0, 'Die Board-ID des Boards in dem der Thread erstellt werden soll.', '', 'filtered_html'),
('node', 'page', 0, 44, 44, 'und', 0, 'Da sich der Ablauf und die Parameter sehr ähneln, verweise ich für weitere Informationen auf <a href="/docs/newreply.php">newreply.php</a> und beschränke mich hier auf die Unterschiede.\r\n\r\nUnterschiede im Ablauf:\r\nAnstelle einer TID wird nur eine PID übergeben.\r\n\r\n<strong>Alle Parameter mit einem post_-Prefix haben hier das Prefix edit_!</strong>\r\nAlso z.B.\r\npost_title => edit_title\r\npost_icon => edit_icon\r\npost_converturls => edit_converturls', '', 'filtered_html'),
('node', 'parameter', 0, 45, 45, 'und', 0, 'Die Posting-ID des zu bearbeitenden Postings.', '', 'filtered_html'),
('node', 'page', 0, 46, 46, 'und', 0, 'Bei den ganzen vielen IDs die es hier gibt, wird einem ja ganz schwindelig.\r\nDaher hier eine Übersicht ;)\r\n\r\n<table class="views-table">\r\n  <thead>\r\n    <tr>\r\n      <th class="views-field">Abk&uuml;rzung:</th>\r\n      <th class="views-field">Name:</th>\r\n      <th class="views-field">Beschreibung:</th>\r\n    </tr>\r\n  </thead>\r\n  <tbody>\r\n    <tr class="odd">\r\n      <td class="views-field">CID</td>\r\n      <td class="views-field">Category-ID</td>\r\n      <td class="views-field">Jedes Board gehört einer Kategorie an, jede Kategorie hat eine eigene CID</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="views-field">BID</td>\r\n      <td class="views-field">Board-ID</td>\r\n      <td class="views-field">Jedes Board hat eine für alle Boards einzigartige ID</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="views-field">TID</td>\r\n      <td class="views-field">Thread-ID</td>\r\n      <td class="views-field">Jeder Thread hat eine über alle Threads einzigartige ID</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="views-field">PID</td>\r\n      <td class="views-field">Posting-ID</td>\r\n      <td class="views-field">Jedes Posting hat ebenso eine ID, die es komplett unabhängig von seinem Thread identifiziert</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="views-field">UID</td>\r\n      <td class="views-field">User-ID</td>\r\n      <td class="views-field">Jeder Benutzer hat seine eigene UID. Die Profilseiten liegen z.B. unter http://my.mods.de/$UID</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="views-field">&nbsp;</td>\r\n      <td class="views-field">Avatar-ID</td>\r\n      <td class="views-field">Ebenso hat jede Instanz eines Avatars seine eigene ID</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="views-field">SID</td>\r\n      <td class="views-field">Session-ID</td>\r\n      <td class="views-field">Wird von PHP verwaltet, identifiziert die Session. Wird als Cookie vom Server gesendet und sollte nach dem Login bei jedem Aufruf wieder zum Server gesendet werden.</td>\r\n    </tr>\r\n  </tbody>\r\n</table>', '', 'full_html');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_data_comment_body'
--

CREATE TABLE IF NOT EXISTS 'field_data_comment_body' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  default NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'comment_body_value' longtext,
  'comment_body_format' varchar default NULL
);

--
-- Daten für Tabelle 'mdexmldocs_field_data_comment_body'
--

INSERT INTO 'field_data_comment_body' ('entity_type', 'bundle', 'deleted', 'entity_id', 'revision_id', 'language', 'delta', 'comment_body_value', 'comment_body_format') VALUES
('comment', 'comment_node_page', 0, 1, 1, 'und', 0, 'Welche Url hat der Login?', 'filtered_html'),
('comment', 'comment_node_page', 0, 2, 2, 'und', 0, 'Ah danke für den Hinweis, das hab'' ich glatt vergessen ;)', 'filtered_html'),
('comment', 'comment_node_page', 0, 3, 3, 'und', 0, 'vllt. als eigene untergruppe gäbe es die bookmark wather/tracker/bla, z.b. <a href="https://addons.mozilla.org/de/firefox/addon/mdebw">meinen</a>', 'filtered_html');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_data_field_image'
--

CREATE TABLE IF NOT EXISTS 'field_data_field_image' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  default NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'field_image_fid' INTEGER  default NULL ,
  'field_image_alt' varchar default NULL ,
  'field_image_title' varchar default NULL
);

--
-- Daten für Tabelle 'mdexmldocs_field_data_field_image'
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_data_field_method'
--

CREATE TABLE IF NOT EXISTS 'field_data_field_method' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  default NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'field_method_value' varchar default NULL
);

--
-- Daten für Tabelle 'mdexmldocs_field_data_field_method'
--

INSERT INTO 'field_data_field_method' ('entity_type', 'bundle', 'deleted', 'entity_id', 'revision_id', 'language', 'delta', 'field_method_value') VALUES
('node', 'parameter', 0, 4, 4, 'und', 0, 'POST'),
('node', 'parameter', 0, 5, 5, 'und', 0, 'POST'),
('node', 'parameter', 0, 6, 6, 'und', 0, 'POST'),
('node', 'parameter', 0, 8, 8, 'und', 0, 'GET'),
('node', 'parameter', 0, 9, 9, 'und', 0, 'GET'),
('node', 'parameter', 0, 13, 13, 'und', 0, 'GET'),
('node', 'parameter', 0, 14, 14, 'und', 0, 'GET'),
('node', 'parameter', 0, 15, 15, 'und', 0, 'GET'),
('node', 'parameter', 0, 16, 16, 'und', 0, 'GET'),
('node', 'parameter', 0, 17, 17, 'und', 0, 'GET'),
('node', 'parameter', 0, 19, 19, 'und', 0, 'GET'),
('node', 'parameter', 0, 20, 20, 'und', 0, 'GET'),
('node', 'parameter', 0, 22, 22, 'und', 0, 'GET'),
('node', 'parameter', 0, 23, 23, 'und', 0, 'GET'),
('node', 'parameter', 0, 24, 24, 'und', 0, 'GET'),
('node', 'parameter', 0, 26, 26, 'und', 0, 'GET'),
('node', 'parameter', 0, 28, 28, 'und', 0, 'POST'),
('node', 'parameter', 0, 29, 29, 'und', 0, 'POST'),
('node', 'parameter', 0, 31, 31, 'und', 0, 'POST'),
('node', 'parameter', 0, 32, 32, 'und', 0, 'POST'),
('node', 'parameter', 0, 33, 33, 'und', 0, 'POST'),
('node', 'parameter', 0, 34, 34, 'und', 0, 'POST'),
('node', 'parameter', 0, 35, 35, 'und', 0, 'POST'),
('node', 'parameter', 0, 36, 36, 'und', 0, 'POST'),
('node', 'parameter', 0, 37, 37, 'und', 0, 'POST'),
('node', 'parameter', 0, 38, 38, 'und', 0, 'POST'),
('node', 'parameter', 0, 40, 40, 'und', 0, 'POST'),
('node', 'parameter', 0, 41, 41, 'und', 0, 'POST'),
('node', 'parameter', 0, 42, 42, 'und', 0, 'POST'),
('node', 'parameter', 0, 43, 43, 'und', 0, 'POST'),
('node', 'parameter', 0, 45, 45, 'und', 0, 'POST');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_data_field_tags'
--

CREATE TABLE IF NOT EXISTS 'field_data_field_tags' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  default NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'field_tags_tid' INTEGER  default NULL
);

--
-- Daten für Tabelle 'mdexmldocs_field_data_field_tags'
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_revision_body'
--

CREATE TABLE IF NOT EXISTS 'field_revision_body' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  NOT NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'body_value' longtext,
  'body_summary' longtext,
  'body_format' varchar default NULL
) ;

--
-- Daten für Tabelle 'mdexmldocs_field_revision_body'
--

INSERT INTO 'field_revision_body' ('entity_type', 'bundle', 'deleted', 'entity_id', 'revision_id', 'language', 'delta', 'body_value', 'body_summary', 'body_format') VALUES
('node', 'page', 0, 1, 1, 'und', 0, 'Hier gehts um die möglichen Queries (Anfragen), die die eigentliche Funktionalität der XML API stellen.\r\nAlle Dateien der XML API liegen im Ordner http://forum.mods.de/bb/xml/, allerdings muss man hin und wieder (z.B. zum Anmelden) auch auf andere Pfade zugreifen). Parameter werden meistens per GET übergeben.\r\nDas ausgegebene XML hält sich an <a href="http://forum.mods.de/bb/forum.xsd">dieses XML-Schema</a>.', '', 'filtered_html'),
('node', 'page', 0, 2, 2, 'und', 0, 'Gibt alle vom angemeldeten Benutzer gesetzten Bookmarks zurück.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<bookmarks newposts="6" count="2">\r\n  <bookmark BMID="92071" newposts="6" PID="1242999267">\r\n    <thread TID="194906" closed="0" pages="325">\r\n      <![CDATA[Hardware-Kaufberatung]]>\r\n    </thread>\r\n    <board BID="10">\r\n      <![CDATA[Hardware & Netzwerk]]>\r\n    </board>\r\n  </bookmark>\r\n  <bookmark BMID="95504" newposts="0" PID="1242999854">\r\n    <thread TID="140831" closed="0" pages="5525">\r\n      <![CDATA[Gehirnsalat]]>\r\n    </thread>\r\n    <board BID="43">\r\n      <![CDATA[Webdesign & Coding]]>\r\n    </board>\r\n  </bookmark>\r\n</bookmarks>\r\n</xml>\r\n\r\n<ul>\r\n    <li>bookmarks ist das root-Element. <br />\r\n        newposts ist die Anzahl der neuen Posts<br />\r\n        count ist die Anzahl der Lesezeichen\r\n        <ul>\r\n            <li>bookmark ist ein einzelnes Lesezeichen<br />\r\n                BMID ist die Bookmark-ID<br />\r\n                newposts ist die Anzahl der neuen Posts<br />\r\n                PID ist die Posting-ID des letztens Posts\r\n                <ul>\r\n                    <li>thread<br />\r\n                        TID ist die Thread-ID<br />\r\n                        closed ob der Thread geschlossen ist<br />\r\n                        pages die Anzahl der Seite<br />\r\n                        Inhalt ist der Titel des Threads\r\n                    </li>\r\n                    <li>board (optional)<br />\r\n                        BID ist die Board-ID<br />\r\n                        Inhalt der Name des Boards\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'page', 0, 3, 3, 'und', 0, 'Um sich einzuloggen reicht es die folgende Kombination an Parametern zu senden;>\r\nMan kann dann recht einfach nachschauen, ob es geklappt hat, wenn man die zurückgegebene Seite\r\nnach dem String "Fehler beim Einloggen" durchsucht. Es kommen Cookies zurück, die man speichern\r\nmuss und bei folgenden Aufrufen wieder an den Server schicken sollte, benutzt man CURL <a href="http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTCOOKIEFILE">kann das\r\nCURL für einen erledigen</a>.\r\nDie Addresse des Logins lautet http://login.mods.de/', '', 'filtered_html'),
('node', 'parameter', 0, 4, 4, 'und', 0, 'Enthält den Benutzernamen', '', 'filtered_html'),
('node', 'parameter', 0, 5, 5, 'und', 0, 'Enthält das Passwort (Klartext).', '', 'filtered_html'),
('node', 'parameter', 0, 6, 6, 'und', 0, 'Gibt an wie lange die Session gültig sein wird, in Sekunden.\r\nÜbliche Werte: <ul><li>3600: Eine Stunde</li>\r\n<li>86400: Ein Tag</li>\r\n<li>604800: Eine Woche</li>\r\n<li>31536000: Ein Jahr</li>\r\n</ul>', '', 'filtered_html'),
('node', 'page', 0, 7, 7, 'und', 0, 'Zum Ausloggen reicht es einen einfachen Request an http://login.mods.de/logout/ abzusetzen.\r\nJetzt kommt das aber: Es gibt einen Sicherungsmechanismus, man muss ein Sicherheitstoken übergeben.\r\n\r\nBei Misserfolg kommt einfach eine leere Seite zurück, bei erfolgtem Ausloggen enthält die Seite den Text "Du hast dich ausgeloggt".', '', 'filtered_html'),
('node', 'parameter', 0, 8, 8, 'und', 0, 'Die User-ID', '', 'filtered_html'),
('node', 'parameter', 0, 9, 9, 'und', 0, 'Der Sicherheitstoken. Der Sicherheitstoken besteht aus 4 Buchstaben oder Zahlen und bleibt über eine ganze Session konstant.\r\nEs gibt keine Möglichkeit über eine schnicke XML-API sich das Sicherheitstoken ausgeben zu lassen.\r\nAm einfachsten kommt man also dran, indem man sich eine beliebige Seite vom Forum ausgeben lässt und den Logout-Link sucht und das Token extrahiert.', '', 'filtered_html'),
('node', 'page', 0, 10, 10, 'und', 0, 'Gibt eine Liste aller Foren zurück.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?> \r\n<categories  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="1224901" count="9">\r\n  <category id="6">\r\n    <name>\r\n      <![CDATA[Allgemeines]]>\r\n    </name>\r\n    <description>\r\n      <![CDATA[Seitenübergreifende Themen]]>\r\n    </description>\r\n    <boards count="4">\r\n      <board id="95">\r\n        <name>\r\n          <![CDATA[3DSupply.de]]>\r\n        </name>\r\n        <description>\r\n          <![CDATA[Alles rund um 3D Supply]]>\r\n        </description>\r\n        <number-of-threads value=''451'' />\r\n        <number-of-replies value=''22040'' />\r\n        <in-category id="6" />\r\n        <lastpost>\r\n          <post>\r\n            <user id="1241980">\r\n              <![CDATA[Chinakohl mit Reis]]>\r\n            </user>\r\n            <date timestamp="1311972627">29.07.2011 22:50:27\r\n            </date>\r\n            <in-thread id="171342">\r\n              <![CDATA[3DSupply Produktfragen]]>\r\n            </in-thread>\r\n            <in-board id="95" />\r\n          </post>\r\n        </lastpost>\r\n        <moderators>\r\n          <user id="2822">\r\n            <![CDATA[Insaniac]]>\r\n          </user>\r\n        </moderators>\r\n      </board>\r\n    </boards>\r\n  </category>\r\n</categories>\r\n</xml>\r\n\r\n<ul>\r\n    <li>categories ist das root-Element.\r\n        current-user-id ist die User-ID des angemeldeten Benutzers\r\n        count ist die Anzahl der Kategorien\r\n        <ul>\r\n            <li>category repräsentiert eine Kategorie\r\n                id ist die Category-ID\r\n                <ul>\r\n                    <li>name</li>\r\n                    <li>description</li>\r\n                    <li>boards\r\n                        count Anzahl\r\n                        <ul>\r\n                            <li>board\r\n                                <ul>\r\n                                    <li>name</li>\r\n                                    <li>desription</li>\r\n                                    <li>number-of-threads\r\n                                        value Anzahl</li>\r\n                                    <li>number-of-replies\r\n                                        value Anzahl</li>\r\n                                    <li>in-category\r\n                                        id Die Category-ID (Könnte das womöglich redundant sein?)</li>\r\n                                    <li>lastpost\r\n                                        <ul>\r\n                                            <li>post\r\n                                                <ul>\r\n                                                    <li>user\r\n                                                        id User-ID\r\n                                                        Inhalt ist der Name</li>\r\n                                                    <li>date\r\n                                                        timestamp ist der UNIX-Zeitstempel\r\n                                                        Inhalt ist ein vorformatiertes Datum im Format DD.MM.YYYY HH:MM:SS</li>\r\n                                                    <li>in-thread\r\n                                                        id ist die Thread-ID\r\n                                                        Inhalt ist der Titel</li>\r\n                                                    <li>in-board\r\n                                                        id ist die Board-ID</li>\r\n                                                </ul>\r\n                                            </li>\r\n                                        </ul>\r\n                                    </li>\r\n                                    <li>moderators\r\n                                        <ul>\r\n                                            <li>user\r\n                           
                     id ist die User-ID</li>\r\n                                        </ul>\r\n                                    </li>\r\n                                </ul>\r\n                            </li>\r\n                        </ul>\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'page', 0, 11, 11, 'und', 0, 'Das hier ist die inoffizielle Dokumentation der XML Schnittstelle des mods.de Forums. Aktuell gibt es keine offizielle Dokumentation, deswegen versuche ich hier möglichst alle Funktionen zentral zu dokumentieren und möglichst ausführlich zu beschreiben.\r\nWenn was fehlt oder hier was falsches stehen sollte, wäre es nett, einen Kommentar zu hinterlassen oder mir im Forum eine <a href="http://my.mods.de/csde_rats">PM zu schreiben</a>.\r\n\r\nHave Fun!', '', 'filtered_html'),
('node', 'page', 0, 12, 12, 'und', 0, 'Die thread.php ist für die Ausgabe von Threads mitsamt Posts zuständig.\r\nGerüchteweise ist es irgendwie möglich die Ausgabe auf einen Post zu beschränken bzw. die Anzahl der Auszugebenden Posts zu verändern. Wie dies gemacht wird ist derzeit jedoch unbekannt.\r\nNormalerweise wird eine vollständige Seite (30 Posts) oder, wenn es nicht soviele Posts gibt, so viele Posts ausgegeben, bis es keine Posts mehr zum Ausgeben gibt. Anders gesagt ist data(/thread/posts/@count) nie größer als 30.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<thread xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="1224901" id="140831">  \r\n  <title>    \r\n    <![CDATA[Gehirnsalat]]>\r\n  </title>    \r\n  <subtitle>      \r\n    <![CDATA[wir unter uns]]>\r\n  </subtitle>      \r\n  <number-of-replies value=''165797'' />      \r\n  <number-of-hits value=''5767761'' />      \r\n  <flags>        \r\n    <is-closed value="0" />        \r\n    <is-sticky value="0" />        \r\n    <is-important value="0" />        \r\n    <is-announcement value="0" />        \r\n    <is-global value="0" />      \r\n  </flags>      \r\n  <in-board id="43" />      \r\n  <firstpost>        \r\n    <post>          \r\n      <user id="19602">            \r\n        <![CDATA[TriggerTG]]>\r\n      </user>            \r\n      <date timestamp="1149182655">01.06.2006 19:24:15\r\n      </date>            \r\n      <in-thread id="140831" />            \r\n      <in-board id="43" />          \r\n    </post>        \r\n  </firstpost>\r\n  <posts page="5528" offset="165810" count="1">                         \r\n    <post id="1243000252">                    \r\n      <user id="1224901" group-id="3">                      \r\n        <![CDATA[csde_rats]]>\r\n      </user>                      \r\n      <date timestamp="1312055567">30.07.2011 21:52:47\r\n      </date>                      \r\n      <message>                        \r\n        <edited count="2">                          \r\n          <lastedit>                            \r\n            <user id="1224901">                              \r\n              <![CDATA[csde_rats]]>\r\n            </user>                              \r\n            <date timestamp="1312055985">30.07.2011 21:59:45\r\n            </date>                            \r\n          </lastedit>                          \r\n        </edited>                          \r\n        <content>                            \r\n          <![CDATA[So ich hab mal angefangen: [URL]http://mde-xml.docs.enkore.de/[/URL] *Le Fu: Muss noch kurz dem werten Gast Rechte geben *erledigt]]>\r\n        </content>                            \r\n        <title>\r\n        </title>                          \r\n      </message>                          \r\n      <avatar id="59224">                            \r\n        <![CDATA[./avatare/german.gif]]>\r\n      </avatar>                            \r\n      <in-thread id="140831">                              \r\n        <![CDATA[Gehirnsalat]]>\r\n      </in-thread>                              \r\n      <in-board id="43" />                            \r\n    </post>                                                                                                                                                                                                            \r\n  </posts>                                                                                                                                                                              \r\n</thread>\r\n</xml>\r\n\r\n<ul>\r\n	<li>thread (root)\r\n    	current-user-id ist die User-ID\r\n        id ist die Thread-ID\r\n		<ul>\r\n        	<li>title\r\n            	Inhalt ist der Threadtitel</li>\r\n        	<li>subtitle\r\n            	Inhalt ist der Untertitel</li>\r\n            <li>number-of-replies\r\n            	value ist die Anzahl der Antworten</li>\r\n            <li>number-of-hits\r\n            	
value ist die Anzahl der Aufrufe</li>\r\n            <li>flags\r\n            	(0=Nein, 1=Ja)\r\n            	<ul>\r\n                	<li>is-closed\r\n                    	value gibt an, ob geschlossen</li>\r\n                    <li>is-sticky\r\n                    	value gibt an, ob angepinnt</li>\r\n                    <li>is-important\r\n                    	value gibt an, ob als wichtig markiert</li>\r\n                    <li>is-announcement\r\n                    	value gibt an, ob als Ankündigung markiert</li>\r\n                    <li>is-global\r\n                    	value gibt an, ob der Thread global (in allen Foren sichtbar) ist</li>\r\n                </ul>\r\n          	</li>\r\n            <li>in-board\r\n            	id ist die Board-ID</li>\r\n            <li>firstpost\r\n            	<ul>\r\n                	<li>user\r\n                    	id ist die User-ID\r\n                        Inhalt der Name</li>\r\n                   	<li>date\r\n                    	timestamp ist ein UNIX-Zeitstempel\r\n                        Inhalt ist ein vorformatiertes Datum</li>\r\n                   	<li>in-thread\r\n                    	id ist die Thread-ID</li>\r\n                    <li>in-board\r\n                    	id ist die Board-ID</li>\r\n           		</ul>\r\n            </li>\r\n            <li>posts\r\n            	page ist die Seite (es werden nie Posts von mehreren Seiten ausgegeben)\r\n                offset die Nummer des ersten Posts auf der Seite (nicht die Post-ID)\r\n                count ist die Anzahl der enthaltenen Elemente (hier 1, weil ich das Beispiel gekürzt habe)\r\n            	<ul>\r\n                	<li>post\r\n                    	id ist die Post-ID\r\n                        <ul>\r\n                        	<li>user\r\n                            	id ist die User-ID\r\n                                group-id ist die Group-ID\r\n                                Inhalt der Name\r\n                            </li>\r\n                            <li>date\r\n                                timestamp ist ein UNIX-Zeitstempel\r\n                                Inhalt ist ein vorformatiertes Datum</li>\r\n                            <li>message\r\n                            	<ul>\r\n                                	<li>edited\r\n                                    	count ist die Anzahl der Bearbeitungen\r\n                                        <ul>\r\n                                        	<li>lastedit\r\n                                                <ul>\r\n                                                    <li>user\r\n                                                        id ist die User-ID\r\n                                                        group-id ist die Group-ID\r\n                                                        Inhalt der Name</li>\r\n                                                    <li>date\r\n                                                        timestamp ist ein UNIX-Zeitstempel\r\n                                                        Inhalt ist ein vorformatiertes Datum</li>\r\n                                                </ul>\r\n                                             </li>\r\n                                        </ul>\r\n                                    </li>\r\n                                    <li>content\r\n                                    	Inhalt ist der Posttext (unprocessed, enthält also BB-Code, Smilies etc. als Plaintext). Es sind <strong>keine</strong> Zeilenumbrüche enthalten.</li>\r\n                                    <li>title\r\n                                    	Inhalt ist der Posttitel, optional</li>\r\n                                </ul>\r\n                            </li>    \r\n                            <li>avatar\r\n                            	id ist die Avatar-ID\r\n                                Inhalt der Dateiname mit der Basis http://forum.mods.de/bb/</li>\r\n                            <li>in-thread\r\n                                id ist die Thread-ID\r\n                              
  Inhalt der Name</li>\r\n                            <li>in-board\r\n                                id ist die Board-ID</li>\r\n                        </ul>\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'parameter', 0, 13, 13, 'und', 0, 'Die Thread-ID des auszugebenden Threads.\r\nWenn keine Thread mit dieser ID existiert oder keine TID angegeben wurde, bekommt man lediglich ein <xml><invalid-thread/></xml> zurück.', '', 'full_html'),
('node', 'parameter', 0, 14, 14, 'und', 0, 'PID gibt eine Post-ID für einen Post an, der auf jeden Fall in der Ausgabe enthalten ist.\r\nWenn in dem Thread kein Post mit dieser ID vorhanden ist, wird die erste Seite zurückgegeben.', '', 'filtered_html'),
('node', 'parameter', 0, 15, 15, 'und', 0, 'Gibt die auszugebende Seite an.\r\nWenn der Thread nicht soviele Seiten hat, hat das Posts-Tag keine Kinder: <xml><posts page="6700000" offset="200999970" count="0"/></xml>\r\n', '', 'full_html'),
('node', 'parameter', 0, 16, 16, 'und', 0, 'Der temp-Parameter wird beim Erstellen eines Posts übergeben um Caching zu verhindern.\r\nStandardmäßig wird hier einfach der aktuelle Timestamp (z.B. 1312117403) übergeben.\r\nHauptsache den Wert gabs vorher nicht....', '', 'filtered_html'),
('node', 'parameter', 0, 17, 17, 'und', 0, 'Gibt die Anzahl der am Anfang zu überspringenden Posts an.\r\nEs wird, sofern der Thread genug Posts hat, immer exakt mit dem offset-ten Post angefangen und von da an bis zum Threadende oder maximal 30 Posts ausgegeben.\r\nWenn der Thread nicht genug Posts hat, kommt ähnliches wie bei Page zurück: <xml><posts offset="89999999999" count="0"/></xml>', '', 'full_html'),
('node', 'page', 0, 18, 18, 'und', 0, 'Wenn ihr auch eine Applikation gebastelt habt, die die API verwendet, könnt ihr einfach einen Kommentar schreiben und ich trags dann hier ein! ;)\r\n\r\n<ul>\r\n<li><a href="http://code.google.com/p/potdroid/">potdroid App für Android</a></li>\r\n<li><a href="http://kamelstall.de/bb/client/">JQuery Client</a></li>\r\n</ul>', '', 'full_html'),
('node', 'parameter', 0, 19, 19, 'und', 0, 'Wenn onlyPID gesetzt ist, wird nur das Posting mit dieser Posting-ID ausgegeben. Dadurch entfällt <strong>nicht</strong> die Angabe der TID.', '', 'filtered_html'),
('node', 'parameter', 0, 20, 20, 'und', 0, 'Wenn update_bookmark 1 ist (Standard: 0), dann wird das Lesezeichen auf den letzten ausgegeben Post verschoben (wie bei der normalen Threadanzeige also)', '', 'filtered_html'),
('node', 'page', 0, 21, 21, 'und', 0, 'Die board.php gibt Infos zu einem Board mit bekannter Board-ID (siehe dazu <a href="/docs/boards.php">boards.php</a>) inklusive einer Threadliste aus.\r\n\r\n<xml title="Beispiel">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<board xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="1224901" id="43">\r\n  <name>\r\n    <![CDATA[Webdesign & Coding]]>\r\n  </name>\r\n  <description>\r\n    <![CDATA[Hello World!]]>\r\n  </description>\r\n  <number-of-threads value="4497"/>\r\n  <number-of-replies value="220990"/>\r\n  <in-category id="21"/>\r\n  <threads with-stickies="1" with-globals="1" page="1" offset="0" count="30">\r\n    <thread id="189020">\r\n      <title>\r\n        <![CDATA[Aktualisierte Forensatzung]]>\r\n      </title>\r\n      <subtitle>\r\n        <![CDATA[vom 28.09.08]]>\r\n      </subtitle>\r\n      <number-of-replies value="0"/>\r\n      <number-of-hits value="45239"/>\r\n      <number-of-pages value="1"/>\r\n      <flags>\r\n        <is-closed value="1"/>\r\n        <is-sticky value="1"/>\r\n        <is-important value="1"/>\r\n        <is-announcement value="1"/>\r\n        <is-global value="1"/>\r\n      </flags>\r\n      <in-board id="14"/>\r\n      <firstpost>\r\n        <post>\r\n          <user id="2822">\r\n            <![CDATA[Insaniac]]>\r\n          </user>\r\n          <date timestamp="1222589113">28.09.2008 10:05:13 \r\n          </date>\r\n          <in-thread id="189020"/>\r\n          <in-board id="14"/>\r\n        </post>\r\n      </firstpost>\r\n    </thread>\r\n  </threads>\r\n</board>\r\n</xml>\r\n\r\n<ul>\r\n	<li>board\r\n    	current-user-id User-ID\r\n        id Board-ID\r\n        <ul>\r\n        	<li>name</li>\r\n            <li>description</li>\r\n            <li>number-of-threads\r\n            	value ist die Anzahl der Threads im Board</li>\r\n            <li>number-of-replies\r\n            	value ist die Anzahl aller Antworten</li>\r\n            <li>in-category\r\n            	id ist die Category-ID</li>\r\n            <li>threads\r\n            	with-stickies spiegelt den Parameter wieder\r\n                with-globals ebenso\r\n                page ist die Seite\r\n                offset ist die Anzahl der am Anfang übersprungenen Threads\r\n                count die Anzahl der Threads dieser Seite\r\n                <ul>\r\n                	<li>thread\r\n                    	id ist die Thread-ID\r\n                        <ul>\r\n                            <li>title\r\n                                Inhalt ist der Threadtitel</li>\r\n                            <li>subtitle\r\n                                Inhalt ist der Untertitel</li>\r\n                            <li>number-of-replies\r\n                                value ist die Anzahl der Antworten</li>\r\n                            <li>number-of-hits\r\n                                value ist die Anzahl der Aufrufe</li>\r\n                            <li>flags\r\n                                (0=Nein, 1=Ja)\r\n                                <ul>\r\n                                    <li>is-closed\r\n                                        value gibt an, ob geschlossen</li>\r\n                                    <li>is-sticky\r\n                                        value gibt an, ob angepinnt</li>\r\n                                    <li>is-important\r\n                                        value gibt an, ob als wichtig markiert</li>\r\n                                    <li>is-announcement\r\n                                        value gibt an, ob als Ankündigung markiert</li>\r\n                                    <li>is-global\r\n                                        value gibt an, ob der Thread global (in allen Foren sichtbar) ist</li>\r\n                                </ul>\r\n                            </li>\r\n                            <li>in-board\r\n                                id ist die Board-ID</li>\r\n                            <li>firstpost\r\n  
                              <ul>\r\n                                    <li>user\r\n                                        id ist die User-ID\r\n                                        Inhalt der Name</li>\r\n                                    <li>date\r\n                                        timestamp ist ein UNIX-Zeitstempel\r\n                                        Inhalt ist ein vorformatiertes Datum</li>\r\n                                    <li>in-thread\r\n                                        id ist die Thread-ID</li>\r\n                                    <li>in-board\r\n                                        id ist die Board-ID</li>\r\n                                </ul>\r\n                            </li>\r\n                        </ul>\r\n                    </li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n    </li>\r\n</ul>', '', 'full_html'),
('node', 'parameter', 0, 22, 22, 'und', 0, 'Anzahl der am Anfang zu überspringenden Threads', '', 'filtered_html'),
('node', 'parameter', 0, 23, 23, 'und', 0, 'Wenn with-globals 1 ist (Standard ist auch 1), dann werden auch globale Threads ausgegeben, ansonsten nicht.', '', 'filtered_html'),
('node', 'parameter', 0, 24, 24, 'und', 0, 'Wenn with-stickies 1 ist (Standard ist auch hier ebenfalls 1), dann werden Stickies ausgegeben, ansonsten... nicht ;)', '', 'filtered_html'),
('node', 'page', 0, 25, 25, 'und', 0, 'Eigentlich ist das relativ nutzlos, da sich das vermutlich eh nie ändern wird... ;D\r\nIch glaube ich brauche hier nichts wirklich zu schreiben, praktisch alle Angaben hieraus kann man auch hardcoden. (Henne-Ei-Problem: Wenn ich settings.php aufrufe um den Basispfad (/settings/base-url) herauszufinden, woher habe ich ihn denn dann ;) )\r\n\r\n<blockquote cite="enos">Es gibt übrigens auch noch eine xml/settings.php, die bisher nirgends verwendet wird und die ich, soweit ich mich erinnern kann, auch noch nirgends verlinkt habe - vermutlich, weil sie ziemlich nutzlos ist - enos</blockquote>\r\n\r\n<xml title="Ausgabe (konstant)">\r\n<?xml version="1.0" encoding="utf-8" ?>\r\n<settings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://forum.mods.de/bb/forum.xsd" current-user-id="0">\r\n  <flags>\r\n    <allow-dynamic-images value="0"/>\r\n    <is-online value="1"/>\r\n  </flags>\r\n  <forum-title>\r\n    <![CDATA[mods.de - Forum]]>\r\n  </forum-title>\r\n  <base-url>\r\n  <![CDATA[http://forum.mods.de/bb]]>\r\n  </base-url>\r\n  <base-url-banners>\r\n  <![CDATA[http://forum.mods.de/bb/img/head/]]>\r\n  </base-url-banners>\r\n  <banner>\r\n    <![CDATA[banner-mde.jpeg]]>\r\n  </banner>\r\n  <replies-per-page>30 \r\n  </replies-per-page>\r\n  <threads-per-page>30 \r\n  </threads-per-page>\r\n</settings>\r\n</xml>\r\n', '', 'full_html'),
('node', 'parameter', 0, 26, 26, 'und', 0, 'Die Board-ID zu der man Informationen abfragen möchte.\r\nWenn es kein Board mit dieser ID gibt, kommt ein <xml><invalid-board/></xml> zurück.', '', 'full_html'),
('node', 'page', 0, 27, 27, 'und', 0, 'Das hier ist nicht direkt Teil der XML API, sondern der POST-Schnittstelle, aber da wir schonmal hier sind ;)\r\nDer Pfad zum Skript lautet http://forum.mods.de/bb/newreply.php\r\n\r\nAblauf:\r\n<ol>\r\n<li>newreply mit der gewünschten TID als GET-Parameter abrufen</li>\r\n<li>Das token rausfriemeln. Dafür bietet sich ein Regex an.</li>\r\n<li>Alle Felderchen brav ausfüllen und abschicken</li>\r\n</ol>\r\n\r\n<strong>Beachte:</strong> Es ist kein multipart/form-data Formular, sondern ein ganz normales!', '', 'filtered_html'),
('node', 'parameter', 0, 28, 28, 'und', 0, 'Die Thread-ID zu der der Post gehören soll', '', 'filtered_html'),
('node', 'parameter', 0, 29, 29, 'und', 0, 'Die Session-ID, aber nur, wenn man sie <strong>nicht</strong> per Cookie übermittelt. Also nie.', '', 'filtered_html'),
('node', 'parameter', 0, 31, 31, 'und', 0, 'token ist ein Sicherheitstoken um Leute wie uns (nein, nicht wirklich ;) ) draußenzuhalten. Es wird vermutlich intern zur Verarbeitung des Aufrufs benötigt und wird uns von der Seite schon fertig ausgeliefert: <xml><input type="hidden" name="token" value="b5c7ad552bcd7063656b7b2fac1ae6eb"></xml>', '', 'full_html'),
('node', 'parameter', 0, 32, 32, 'und', 0, 'Der Name sagt alles, der Titel des Posts.', '', 'filtered_html'),
('node', 'parameter', 0, 33, 33, 'und', 0, 'Nachrichteninhalt. Maximallänge: 15.000 Bytes bzw. rund 15 KB', '', 'filtered_html'),
('node', 'parameter', 0, 34, 34, 'und', 0, 'Wenn dieser Parameter übertragen wird und 1 ist, werden [URL]-Tags automatisch eingefügt', '', 'filtered_html'),
('node', 'parameter', 0, 35, 35, 'und', 0, 'Wenn dieser Parameter übertragen wird und 1 ist, wird BB-Code für diesen Post deaktiviert', '', 'filtered_html'),
('node', 'parameter', 0, 36, 36, 'und', 0, 'Wenn dieser Parameter übertragen wird und 1 ist, werden keine Smilies erzeugt', '', 'filtered_html'),
('node', 'parameter', 0, 37, 37, 'und', 0, 'Sollte "Eintragen" als Wert haben. Ich weiß nicht ob das überprüft wird, aber es ist definitv cleaner.', '', 'filtered_html'),
('node', 'parameter', 0, 38, 38, 'und', 0, 'Das Icon des Posts.\r\nMögliche Werte:\r\n<ul>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon2.gif" alt="Icon" />: 32</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon11.gif" alt="Icon" />: 40</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon4.gif" alt="Icon" />: 34</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon3.gif" alt="Icon" />: 33</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon12.gif" alt="Icon" />: 41</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/thumbsup.gif" alt="Icon" />: 2</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/thumbsdown.gif" alt="Icon" />: 1</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/pfeil.gif" alt="Icon" />: 54</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon8.gif" alt="Icon" />: 38</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon5.gif" alt="Icon" />: 35</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon9.gif" alt="Icon" />: 28</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon13.gif" alt="Icon" />: 42</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon6.gif" alt="Icon" />: 36</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon10.gif" alt="Icon" />: 39</li>\r\n<li><img src="http://forum.mods.de/bb/img/icons/icon7.gif" alt="Icon" />: 37</li>\r\n<li>Kein Icon: 0</li>\r\n</ul>', '', 'full_html'),
('node', 'page', 0, 39, 39, 'und', 0, 'Da sich der Ablauf und die Parameter sehr ähneln, verweise ich für weitere Informationen auf <a href="/docs/newreply.php">newreply.php</a> und beschränke mich hier auf die Unterschiede.\r\n\r\nUnterschiede im Ablauf:\r\nAnstelle der TID wird die BID (Board-ID) übergeben.', '', 'filtered_html'),
('node', 'parameter', 0, 40, 40, 'und', 0, 'Thread Titel', '', 'filtered_html'),
('node', 'parameter', 0, 41, 41, 'und', 0, 'Thread Untertitel', '', 'filtered_html'),
('node', 'parameter', 0, 42, 42, 'und', 0, 'Thread Tags', '', 'filtered_html'),
('node', 'parameter', 0, 43, 43, 'und', 0, 'Die Board-ID des Boards in dem der Thread erstellt werden soll.', '', 'filtered_html'),
('node', 'page', 0, 44, 44, 'und', 0, 'Da sich der Ablauf und die Parameter sehr ähneln, verweise ich für weitere Informationen auf <a href="/docs/newreply.php">newreply.php</a> und beschränke mich hier auf die Unterschiede.\r\n\r\nUnterschiede im Ablauf:\r\nAnstelle einer TID wird nur eine PID übergeben.\r\n\r\n<strong>Alle Parameter mit einem post_-Prefix haben hier das Prefix edit_!</strong>\r\nAlso z.B.\r\npost_title => edit_title\r\npost_icon => edit_icon\r\npost_converturls => edit_converturls', '', 'filtered_html'),
('node', 'parameter', 0, 45, 45, 'und', 0, 'Die Posting-ID des zu bearbeitenden Postings.', '', 'filtered_html'),
('node', 'page', 0, 46, 46, 'und', 0, 'Bei den ganzen vielen IDs die es hier gibt, wird einem ja ganz schwindelig.\r\nDaher hier eine Übersicht ;)\r\n\r\n<table class="views-table">\r\n  <thead>\r\n    <tr>\r\n      <th class="views-field">Abk&uuml;rzung:</th>\r\n      <th class="views-field">Name:</th>\r\n      <th class="views-field">Beschreibung:</th>\r\n    </tr>\r\n  </thead>\r\n  <tbody>\r\n    <tr class="odd">\r\n      <td class="views-field">CID</td>\r\n      <td class="views-field">Category-ID</td>\r\n      <td class="views-field">Jedes Board gehört einer Kategorie an, jede Kategorie hat eine eigene CID</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="views-field">BID</td>\r\n      <td class="views-field">Board-ID</td>\r\n      <td class="views-field">Jedes Board hat eine für alle Boards einzigartige ID</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="views-field">TID</td>\r\n      <td class="views-field">Thread-ID</td>\r\n      <td class="views-field">Jeder Thread hat eine über alle Threads einzigartige ID</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="views-field">PID</td>\r\n      <td class="views-field">Posting-ID</td>\r\n      <td class="views-field">Jedes Posting hat ebenso eine ID, die es komplett unabhängig von seinem Thread identifiziert</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="views-field">UID</td>\r\n      <td class="views-field">User-ID</td>\r\n      <td class="views-field">Jeder Benutzer hat seine eigene UID. Die Profilseiten liegen z.B. unter http://my.mods.de/$UID</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="views-field">&nbsp;</td>\r\n      <td class="views-field">Avatar-ID</td>\r\n      <td class="views-field">Ebenso hat jede Instanz eines Avatars seine eigene ID</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="views-field">SID</td>\r\n      <td class="views-field">Session-ID</td>\r\n      <td class="views-field">Wird von PHP verwaltet, identifiziert die Session. Wird als Cookie vom Server gesendet und sollte nach dem Login bei jedem Aufruf wieder zum Server gesendet werden.</td>\r\n    </tr>\r\n  </tbody>\r\n</table>', '', 'full_html');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_revision_comment_body'
--

CREATE TABLE IF NOT EXISTS 'field_revision_comment_body' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  NOT NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'comment_body_value' longtext,
  'comment_body_format' varchar default NULL
) ;

--
-- Daten für Tabelle 'mdexmldocs_field_revision_comment_body'
--

INSERT INTO 'field_revision_comment_body' ('entity_type', 'bundle', 'deleted', 'entity_id', 'revision_id', 'language', 'delta', 'comment_body_value', 'comment_body_format') VALUES
('comment', 'comment_node_page', 0, 1, 1, 'und', 0, 'Welche Url hat der Login?', 'filtered_html'),
('comment', 'comment_node_page', 0, 2, 2, 'und', 0, 'Ah danke für den Hinweis, das hab'' ich glatt vergessen ;)', 'filtered_html'),
('comment', 'comment_node_page', 0, 3, 3, 'und', 0, 'vllt. als eigene untergruppe gäbe es die bookmark wather/tracker/bla, z.b. <a href="https://addons.mozilla.org/de/firefox/addon/mdebw">meinen</a>', 'filtered_html');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_revision_field_image'
--

CREATE TABLE IF NOT EXISTS 'field_revision_field_image' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  NOT NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'field_image_fid' INTEGER  default NULL ,
  'field_image_alt' varchar default NULL ,
  'field_image_title' varchar default NULL 
) ;

--
-- Daten für Tabelle mdexmldocs_field_revision_field_image
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_field_revision_field_method'
--

CREATE TABLE IF NOT EXISTS 'field_revision_field_method' (
  'entity_type' varchar NOT NULL default '' ,
  'bundle' varchar NOT NULL default '' ,
  'deleted' tinyint(4) NOT NULL default '0' ,
  'entity_id' INTEGER  NOT NULL ,
  'revision_id' INTEGER  NOT NULL ,
  'language' varchar NOT NULL default '' ,
  'delta' INTEGER  NOT NULL ,
  'field_method_value' varchar default NULL
);

--
-- Daten für Tabelle 'mdexmldocs_field_revision_field_method'
--

INSERT INTO 'field_revision_field_method' ('entity_type', 'bundle', 'deleted', 'entity_id', 'revision_id', 'language', 'delta', 'field_method_value') VALUES
('node', 'parameter', 0, 4, 4, 'und', 0, 'POST'),
('node', 'parameter', 0, 5, 5, 'und', 0, 'POST'),
('node', 'parameter', 0, 6, 6, 'und', 0, 'POST'),
('node', 'parameter', 0, 8, 8, 'und', 0, 'GET'),
('node', 'parameter', 0, 9, 9, 'und', 0, 'GET'),
('node', 'parameter', 0, 13, 13, 'und', 0, 'GET'),
('node', 'parameter', 0, 14, 14, 'und', 0, 'GET'),
('node', 'parameter', 0, 15, 15, 'und', 0, 'GET'),
('node', 'parameter', 0, 16, 16, 'und', 0, 'GET'),
('node', 'parameter', 0, 17, 17, 'und', 0, 'GET'),
('node', 'parameter', 0, 19, 19, 'und', 0, 'GET'),
('node', 'parameter', 0, 20, 20, 'und', 0, 'GET'),
('node', 'parameter', 0, 22, 22, 'und', 0, 'GET'),
('node', 'parameter', 0, 23, 23, 'und', 0, 'GET'),
('node', 'parameter', 0, 24, 24, 'und', 0, 'GET'),
('node', 'parameter', 0, 26, 26, 'und', 0, 'GET'),
('node', 'parameter', 0, 28, 28, 'und', 0, 'POST'),
('node', 'parameter', 0, 29, 29, 'und', 0, 'POST'),
('node', 'parameter', 0, 31, 31, 'und', 0, 'POST'),
('node', 'parameter', 0, 32, 32, 'und', 0, 'POST'),
('node', 'parameter', 0, 33, 33, 'und', 0, 'POST'),
('node', 'parameter', 0, 34, 34, 'und', 0, 'POST'),
('node', 'parameter', 0, 35, 35, 'und', 0, 'POST'),
('node', 'parameter', 0, 36, 36, 'und', 0, 'POST'),
('node', 'parameter', 0, 37, 37, 'und', 0, 'POST'),
('node', 'parameter', 0, 38, 38, 'und', 0, 'POST'),
('node', 'parameter', 0, 40, 40, 'und', 0, 'POST'),
('node', 'parameter', 0, 41, 41, 'und', 0, 'POST'),
('node', 'parameter', 0, 42, 42, 'und', 0, 'POST'),
('node', 'parameter', 0, 43, 43, 'und', 0, 'POST'),
('node', 'parameter', 0, 45, 45, 'und', 0, 'POST');

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle 'mdexmldocs_node'
--

CREATE TABLE IF NOT EXISTS 'node' (
  'nid' INTEGER unsigned NOT NULL,
  'vid' INTEGER unsigned NOT NULL default '0' ,
  'type' varchar NOT NULL default '' ,
  'language' varchar NOT NULL default '' ,
  'title' varchar NOT NULL default '' ,
  'uid' INTEGER NOT NULL default '0' ,
  'status' INTEGER NOT NULL default '1' ,
  'created' INTEGER NOT NULL default '0' ,
  'changed' INTEGER NOT NULL default '0' ,
  'comment' INTEGER NOT NULL default '0' ,
  'promote' INTEGER NOT NULL default '0' ,
  'sticky' INTEGER NOT NULL default '0' ,
  'tnid' INTEGER unsigned NOT NULL default '0' ,
  'translate' INTEGER NOT NULL default '0' 
) ;

--
-- Daten für Tabelle 'mdexmldocs_node'
--

INSERT INTO 'node' ('nid', 'vid', 'type', 'language', 'title', 'uid', 'status', 'created', 'changed', 'comment', 'promote', 'sticky', 'tnid', 'translate') VALUES
(1, 1, 'page', 'de', 'Queries', 1, 1, 1312054335, 1312118632, 2, 0, 0, 0, 0),
(2, 2, 'page', 'de', 'bookmarks.php', 1, 1, 1312054908, 1312111028, 2, 0, 0, 0, 0),
(3, 3, 'page', 'de', 'Login', 1, 1, 1312057059, 1312113543, 2, 0, 0, 0, 0),
(4, 4, 'parameter', 'de', 'login_username', 1, 1, 1312057706, 1312057706, 1, 0, 0, 0, 0),
(5, 5, 'parameter', 'de', 'login_password', 1, 1, 1312057864, 1312057864, 1, 0, 0, 0, 0),
(6, 6, 'parameter', 'de', 'login_lifetime', 1, 1, 1312057996, 1312057996, 1, 0, 0, 0, 0),
(7, 7, 'page', 'de', 'Logout', 1, 1, 1312058114, 1312058664, 2, 0, 0, 0, 0),
(8, 8, 'parameter', 'de', 'UID', 1, 1, 1312058343, 1312058357, 1, 0, 0, 0, 0),
(9, 9, 'parameter', 'de', 'a', 1, 1, 1312058419, 1312062469, 1, 0, 0, 0, 0),
(10, 10, 'page', 'de', 'boards.php', 1, 1, 1312060052, 1312110988, 2, 0, 0, 0, 0),
(11, 11, 'page', 'de', 'mods.de Forum XML API Dokumentation', 1, 1, 1312110517, 1312138706, 2, 0, 0, 0, 0),
(12, 12, 'page', 'de', 'thread.php', 1, 1, 1312115749, 1312123393, 2, 0, 0, 0, 0),
(13, 13, 'parameter', 'de', 'TID', 1, 1, 1312115791, 1312116045, 1, 0, 0, 0, 0),
(14, 14, 'parameter', 'de', 'PID', 1, 1, 1312115880, 1312115880, 1, 0, 0, 0, 0),
(15, 15, 'parameter', 'de', 'page', 1, 1, 1312115963, 1312115983, 1, 0, 0, 0, 0),
(16, 16, 'parameter', 'de', 'temp', 1, 1, 1312116075, 1312121100, 1, 0, 0, 0, 0),
(17, 17, 'parameter', 'de', 'offset', 1, 1, 1312116762, 1312116762, 1, 0, 0, 0, 0),
(18, 18, 'page', 'de', 'Applikationen', 1, 1, 1312116920, 1312116976, 2, 0, 0, 0, 0),
(19, 19, 'parameter', 'de', 'onlyPID', 1, 1, 1312127378, 1312128186, 1, 0, 0, 0, 0),
(20, 20, 'parameter', 'de', 'update_bookmark', 1, 1, 1312127423, 1312127423, 1, 0, 0, 0, 0),
(21, 21, 'page', 'de', 'board.php', 1, 1, 1312127720, 1312135466, 2, 0, 0, 0, 0),
(22, 22, 'parameter', 'de', 'offset', 1, 1, 1312127768, 1312127768, 1, 0, 0, 0, 0),
(23, 23, 'parameter', 'de', 'with-globals', 1, 1, 1312127805, 1312127805, 1, 0, 0, 0, 0),
(24, 24, 'parameter', 'de', 'with-stickies', 1, 1, 1312127839, 1312127839, 1, 0, 0, 0, 0),
(25, 25, 'page', 'de', 'settings.php', 1, 1, 1312134914, 1312151340, 2, 0, 0, 0, 0),
(26, 26, 'parameter', 'de', 'BID', 1, 1, 1312135491, 1312135541, 1, 0, 0, 0, 0),
(27, 27, 'page', 'de', 'newreply.php', 1, 1, 1312137388, 1312140800, 2, 0, 0, 0, 0),
(28, 28, 'parameter', 'de', 'TID', 1, 1, 1312137622, 1312137622, 1, 0, 0, 0, 0),
(29, 29, 'parameter', 'de', 'SID', 1, 1, 1312137652, 1312137652, 1, 0, 0, 0, 0),
(31, 31, 'parameter', 'de', 'token', 1, 1, 1312137753, 1312137943, 1, 0, 0, 0, 0),
(32, 32, 'parameter', 'de', 'post_title', 1, 1, 1312137797, 1312137797, 1, 0, 0, 0, 0),
(33, 33, 'parameter', 'de', 'message', 1, 1, 1312137857, 1312137879, 1, 0, 0, 0, 0),
(34, 34, 'parameter', 'de', 'post_converturls', 1, 1, 1312137932, 1312137974, 1, 0, 0, 0, 0),
(35, 35, 'parameter', 'de', 'post_disablebbcode', 1, 1, 1312137995, 1312137995, 1, 0, 0, 0, 0),
(36, 36, 'parameter', 'de', 'post_disablesmilies', 1, 1, 1312138015, 1312138025, 1, 0, 0, 0, 0),
(37, 37, 'parameter', 'de', 'submit', 1, 1, 1312138093, 1312138093, 1, 0, 0, 0, 0),
(38, 38, 'parameter', 'de', 'post_icon', 1, 1, 1312138367, 1312138469, 1, 0, 0, 0, 0),
(39, 39, 'page', 'de', 'newthread.php', 1, 1, 1312140521, 1312140764, 2, 0, 0, 0, 0),
(40, 40, 'parameter', 'de', 'thread_title', 1, 1, 1312140540, 1312140540, 1, 0, 0, 0, 0),
(41, 41, 'parameter', 'de', 'thread_subtitle', 1, 1, 1312140621, 1312140621, 1, 0, 0, 0, 0),
(42, 42, 'parameter', 'de', 'thread_tags', 1, 1, 1312140645, 1312140645, 1, 0, 0, 0, 0),
(43, 43, 'parameter', 'de', 'BID', 1, 1, 1312140694, 1312140694, 1, 0, 0, 0, 0),
(44, 44, 'page', 'de', 'editreply.php', 1, 1, 1312140935, 1312140970, 2, 0, 0, 0, 0),
(45, 45, 'parameter', 'de', 'PID', 1, 1, 1312140956, 1312140956, 1, 0, 0, 0, 0),
(46, 46, 'page', 'de', 'Identifikatoren', 1, 1, 1312141510, 1312141510, 2, 0, 0, 0, 0);

CREATE TABLE IF NOT EXISTS 'nodehierarchy_menu_links' (
  'mlid' int(10) NOT NULL default '0' ,
  'nid' int(11) NOT NULL default '0' 
);

--
-- Daten für Tabelle 'mdexmldocs_nodehierarchy_menu_links'
--

INSERT INTO 'nodehierarchy_menu_links' ('mlid', 'nid') VALUES
(375, 1),
(376, 2),
(402, 3),
(404, 4),
(405, 5),
(406, 6),
(407, 7),
(409, 8),
(410, 9),
(411, 10),
(420, 12),
(421, 13),
(422, 14),
(423, 15),
(424, 16),
(425, 17),
(442, 19),
(443, 20),
(444, 21),
(445, 22),
(446, 23),
(447, 24),
(448, 25),
(449, 26),
(450, 27),
(451, 28),
(452, 29),
(454, 31),
(455, 32),
(456, 33),
(457, 34),
(458, 35),
(459, 36),
(460, 37),
(461, 38),
(462, 39),
(463, 40),
(464, 41),
(465, 42),
(466, 43),
(467, 44),
(468, 45);

CREATE TABLE IF NOT EXISTS 'menu_links' (
  'menu_name' varchar(32) NOT NULL default '' ,
  'mlid' int(10) NOT NULL ,
  'plid' int(10) NOT NULL default '0' ,
  'link_path' varchar(255) NOT NULL default '' ,
  'router_path' varchar(255) NOT NULL default '' ,
  'link_title' varchar(255) NOT NULL default '' ,
  'options' blob ,
  'module' varchar(255) NOT NULL default 'system' ,
  'hidden' smallint(6) NOT NULL default '0' ,
  'external' smallint(6) NOT NULL default '0' ,
  'has_children' smallint(6) NOT NULL default '0' ,
  'expanded' smallint(6) NOT NULL default '0' ,
  'weight' int(11) NOT NULL default '0' ,
  'depth' smallint(6) NOT NULL default '0' ,
  'customized' smallint(6) NOT NULL default '0' ,
  'p1' int(10)  NOT NULL default '0' ,
  'p2' int(10)  NOT NULL default '0' ,
  'p3' int(10)  NOT NULL default '0' ,
  'p4' int(10)  NOT NULL default '0' ,
  'p5' int(10)  NOT NULL default '0' ,
  'p6' int(10)  NOT NULL default '0' ,
  'p7' int(10)  NOT NULL default '0' ,
  'p8' int(10)  NOT NULL default '0' ,
  'p9' int(10)  NOT NULL default '0' ,
  'updated' smallint(6) NOT NULL default '0' 
);

--
-- Daten für Tabelle `mdexmldocs_menu_links`
--

INSERT INTO 'menu_links' ('menu_name', 'mlid', 'plid', 'link_path', 'router_path', 'link_title', 'options', 'module', 'hidden', 'external', 'has_children', 'expanded', 'weight', 'depth', 'customized', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9', 'updated') VALUES
('management', 1, 0, 'admin', 'admin', 'Administration', 0, 'system', 0, 0, 1, 0, 9, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 2, 0, 'user', 'user', 'User account', 0, 'system', 0, 0, 0, 0, -10, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'comment/%', 'comment/%', 'Comment permalink', 0, 'system', 0, 0, 1, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'filter/tips', 'filter/tips', 'Compose tips', 0, 'system', 1, 0, 0, 0, 0, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'node/%', 'node/%', '', 0, 'system', 0, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'node/add', 'node/add', 'Add content', 0, 'system', 0, 0, 1, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 7, 1, 'admin/appearance', 'admin/appearance', 'Appearance', 0, 'system', 0, 0, 0, 0, -6, 2, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 8, 1, 'admin/config', 'admin/config', 'Configuration', 0, 'system', 0, 0, 1, 0, 0, 2, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 9, 1, 'admin/content', 'admin/content', 'Content', 0, 'system', 0, 0, 1, 0, -10, 2, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 10, 2, 'user/register', 'user/register', 'Create new account', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 11, 1, 'admin/dashboard', 'admin/dashboard', 'Dashboard', 0, 'system', 0, 0, 0, 0, -15, 2, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 12, 1, 'admin/index', 'admin/index', 'Index', 0, 'system', -1, 0, 0, 0, -18, 2, 0, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 13, 2, 'user/login', 'user/login', 'Log in', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 13, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 14, 0, 'user/logout', 'user/logout', 'Log out', 0, 'system', 0, 0, 0, 0, 10, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 15, 1, 'admin/modules', 'admin/modules', 'Modules', 0, 'system', 0, 0, 0, 0, -2, 2, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 16, 0, 'user/%', 'user/%', 'My account', 0, 'system', 0, 0, 1, 0, 0, 1, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 17, 1, 'admin/people', 'admin/people', 'People', 0, 'system', 0, 0, 0, 0, -4, 2, 0, 1, 17, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 18, 1, 'admin/reports', 'admin/reports', 'Reports', 0, 'system', 0, 0, 1, 0, 5, 2, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 19, 2, 'user/password', 'user/password', 'Request new password', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 19, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 20, 1, 'admin/structure', 'admin/structure', 'Structure', 0, 'system', 0, 0, 1, 0, -8, 2, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 21, 1, 'admin/tasks', 'admin/tasks', 'Tasks', 0, 'system', -1, 0, 0, 0, -20, 2, 0, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 22, 0, 'comment/reply/%', 'comment/reply/%', 'Add new comment', 0, 'system', 0, 0, 0, 0, 0, 1, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 23, 3, 'comment/%/approve', 'comment/%/approve', 'Approve', 0, 'system', 0, 0, 0, 0, 1, 2, 0, 3, 23, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 24, 3, 'comment/%/delete', 'comment/%/delete', 'Delete', 0, 'system', -1, 0, 0, 0, 2, 2, 0, 3, 24, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 25, 3, 'comment/%/edit', 'comment/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 3, 25, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 27, 3, 'comment/%/view', 'comment/%/view', 'View comment', 0, 'system', -1, 0, 0, 0, -10, 2, 0, 3, 27, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 28, 17, 'admin/people/create', 'admin/people/create', 'Add user', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 17, 28, 0, 0, 0, 0, 0, 0, 0),
('management', 29, 20, 'admin/structure/block', 'admin/structure/block', 'Blocks', 0, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 20, 29, 0, 0, 0, 0, 0, 0, 0),
('navigation', 30, 16, 'user/%/cancel', 'user/%/cancel', 'Cancel account', 0, 'system', 0, 0, 1, 0, 0, 2, 0, 16, 30, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 31, 9, 'admin/content/comment', 'admin/content/comment', 'Comments', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 9, 31, 0, 0, 0, 0, 0, 0, 0),
('management', 32, 11, 'admin/dashboard/configure', 'admin/dashboard/configure', 'Configure available dashboard blocks', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 32, 0, 0, 0, 0, 0, 0, 0),
('management', 33, 9, 'admin/content/node', 'admin/content/node', 'Content', 0, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 9, 33, 0, 0, 0, 0, 0, 0, 0),
('management', 34, 8, 'admin/config/content', 'admin/config/content', 'Content authoring', 0, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 34, 0, 0, 0, 0, 0, 0, 0),
('management', 35, 20, 'admin/structure/types', 'admin/structure/types', 'Content types', 0, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 20, 35, 0, 0, 0, 0, 0, 0, 0),
('management', 36, 11, 'admin/dashboard/customize', 'admin/dashboard/customize', 'Customize dashboard', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 36, 0, 0, 0, 0, 0, 0, 0),
('navigation', 37, 5, 'node/%/delete', 'node/%/delete', 'Delete', 0, 'system', -1, 0, 0, 0, 1, 2, 0, 5, 37, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 38, 8, 'admin/config/development', 'admin/config/development', 'Development', 0, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 38, 0, 0, 0, 0, 0, 0, 0),
('navigation', 39, 16, 'user/%/edit', 'user/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 16, 39, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 40, 5, 'node/%/edit', 'node/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 5, 40, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 41, 18, 'admin/reports/fields', 'admin/reports/fields', 'Field list', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 18, 41, 0, 0, 0, 0, 0, 0, 0),
('management', 42, 7, 'admin/appearance/list', 'admin/appearance/list', 'List', 0, 'system', -1, 0, 0, 0, -1, 3, 0, 1, 7, 42, 0, 0, 0, 0, 0, 0, 0),
('management', 43, 15, 'admin/modules/list', 'admin/modules/list', 'List', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 15, 43, 0, 0, 0, 0, 0, 0, 0),
('management', 44, 17, 'admin/people/people', 'admin/people/people', 'List', 0, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 17, 44, 0, 0, 0, 0, 0, 0, 0),
('management', 45, 8, 'admin/config/media', 'admin/config/media', 'Media', 0, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 45, 0, 0, 0, 0, 0, 0, 0),
('management', 46, 20, 'admin/structure/menu', 'admin/structure/menu', 'Menus', 0, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 20, 46, 0, 0, 0, 0, 0, 0, 0),
('management', 47, 8, 'admin/config/people', 'admin/config/people', 'People', 0, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 47, 0, 0, 0, 0, 0, 0, 0),
('management', 48, 17, 'admin/people/permissions', 'admin/people/permissions', 'Permissions', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 17, 48, 0, 0, 0, 0, 0, 0, 0),
('management', 49, 18, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log messages', 0, 'system', 0, 0, 0, 0, -1, 3, 0, 1, 18, 49, 0, 0, 0, 0, 0, 0, 0),
('management', 50, 8, 'admin/config/regional', 'admin/config/regional', 'Regional and language', 0, 'system', 0, 0, 1, 0, -5, 3, 0, 1, 8, 50, 0, 0, 0, 0, 0, 0, 0),
('navigation', 51, 5, 'node/%/revisions', 'node/%/revisions', 'Revisions', 0, 'system', -1, 0, 1, 0, 2, 2, 0, 5, 51, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 52, 8, 'admin/config/search', 'admin/config/search', 'Search and metadata', 0, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 52, 0, 0, 0, 0, 0, 0, 0),
('management', 53, 7, 'admin/appearance/settings', 'admin/appearance/settings', 'Settings', 0, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 7, 53, 0, 0, 0, 0, 0, 0, 0),
('management', 54, 18, 'admin/reports/status', 'admin/reports/status', 'Status report', 0, 'system', 0, 0, 0, 0, -60, 3, 0, 1, 18, 54, 0, 0, 0, 0, 0, 0, 0),
('management', 55, 8, 'admin/config/system', 'admin/config/system', 'System', 0, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 55, 0, 0, 0, 0, 0, 0, 0),
('management', 57, 18, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 18, 57, 0, 0, 0, 0, 0, 0, 0),
('management', 58, 18, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 18, 58, 0, 0, 0, 0, 0, 0, 0),
('management', 59, 15, 'admin/modules/uninstall', 'admin/modules/uninstall', 'Uninstall', 0, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 15, 59, 0, 0, 0, 0, 0, 0, 0),
('management', 60, 8, 'admin/config/user-interface', 'admin/config/user-interface', 'User interface', 0, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 60, 0, 0, 0, 0, 0, 0, 0),
('navigation', 61, 5, 'node/%/view', 'node/%/view', 'View', 0, 'system', -1, 0, 0, 0, -10, 2, 0, 5, 61, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 62, 16, 'user/%/view', 'user/%/view', 'View', 0, 'system', -1, 0, 0, 0, -10, 2, 0, 16, 62, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 63, 8, 'admin/config/services', 'admin/config/services', 'Web services', 0, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 8, 63, 0, 0, 0, 0, 0, 0, 0),
('management', 64, 8, 'admin/config/workflow', 'admin/config/workflow', 'Workflow', 0, 'system', 0, 0, 0, 0, 5, 3, 0, 1, 8, 64, 0, 0, 0, 0, 0, 0, 0),
('management', 67, 47, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Account settings', 0, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 47, 67, 0, 0, 0, 0, 0, 0),
('management', 68, 53, 'admin/appearance/settings/acquia_prosper', 'admin/appearance/settings/acquia_prosper', 'Acquia Prosper', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 68, 0, 0, 0, 0, 0, 0),
('management', 69, 55, 'admin/config/system/actions', 'admin/config/system/actions', 'Actions', 0, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 55, 69, 0, 0, 0, 0, 0, 0),
('management', 70, 29, 'admin/structure/block/add', 'admin/structure/block/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 70, 0, 0, 0, 0, 0, 0),
('management', 71, 35, 'admin/structure/types/add', 'admin/structure/types/add', 'Add content type', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 35, 71, 0, 0, 0, 0, 0, 0),
('management', 72, 46, 'admin/structure/menu/add', 'admin/structure/menu/add', 'Add menu', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 46, 72, 0, 0, 0, 0, 0, 0),
('management', 74, 53, 'admin/appearance/settings/bartik', 'admin/appearance/settings/bartik', 'Bartik', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 74, 0, 0, 0, 0, 0, 0),
('management', 75, 52, 'admin/config/search/clean-urls', 'admin/config/search/clean-urls', 'Clean URLs', 0, 'system', 0, 0, 0, 0, 5, 4, 0, 1, 8, 52, 75, 0, 0, 0, 0, 0, 0),
('management', 76, 55, 'admin/config/system/cron', 'admin/config/system/cron', 'Cron', 0, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 55, 76, 0, 0, 0, 0, 0, 0),
('management', 77, 50, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Date and time', 0, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 50, 77, 0, 0, 0, 0, 0, 0),
('management', 78, 18, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 18, 78, 0, 0, 0, 0, 0, 0, 0),
('management', 79, 45, 'admin/config/media/file-system', 'admin/config/media/file-system', 'File system', 0, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 45, 79, 0, 0, 0, 0, 0, 0),
('management', 80, 53, 'admin/appearance/settings/fusion_core', 'admin/appearance/settings/fusion_core', 'Fusion Core', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 80, 0, 0, 0, 0, 0, 0),
('management', 81, 53, 'admin/appearance/settings/fusion_starter', 'admin/appearance/settings/fusion_starter', 'Fusion Starter', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 81, 0, 0, 0, 0, 0, 0),
('management', 82, 53, 'admin/appearance/settings/fusion_starter_lite', 'admin/appearance/settings/fusion_starter_lite', 'Fusion Starter Lite', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 82, 0, 0, 0, 0, 0, 0),
('management', 83, 53, 'admin/appearance/settings/garland', 'admin/appearance/settings/garland', 'Garland', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 83, 0, 0, 0, 0, 0, 0),
('management', 84, 53, 'admin/appearance/settings/global', 'admin/appearance/settings/global', 'Global settings', 0, 'system', -1, 0, 0, 0, -1, 4, 0, 1, 7, 53, 84, 0, 0, 0, 0, 0, 0),
('management', 85, 47, 'admin/config/people/ip-blocking', 'admin/config/people/ip-blocking', 'IP address blocking', 0, 'system', 0, 0, 1, 0, 10, 4, 0, 1, 8, 47, 85, 0, 0, 0, 0, 0, 0),
('management', 86, 45, 'admin/config/media/image-toolkit', 'admin/config/media/image-toolkit', 'Image toolkit', 0, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 45, 86, 0, 0, 0, 0, 0, 0),
('management', 87, 43, 'admin/modules/list/confirm', 'admin/modules/list/confirm', 'List', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 15, 43, 87, 0, 0, 0, 0, 0, 0),
('management', 88, 35, 'admin/structure/types/list', 'admin/structure/types/list', 'List', 0, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 20, 35, 88, 0, 0, 0, 0, 0, 0),
('management', 90, 46, 'admin/structure/menu/list', 'admin/structure/menu/list', 'List menus', 0, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 20, 46, 90, 0, 0, 0, 0, 0, 0),
('management', 91, 38, 'admin/config/development/logging', 'admin/config/development/logging', 'Logging and errors', 0, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 38, 91, 0, 0, 0, 0, 0, 0),
('management', 92, 38, 'admin/config/development/maintenance', 'admin/config/development/maintenance', 'Maintenance mode', 0, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 38, 92, 0, 0, 0, 0, 0, 0),
('management', 93, 38, 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 0, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 38, 93, 0, 0, 0, 0, 0, 0),
('management', 94, 48, 'admin/people/permissions/list', 'admin/people/permissions/list', 'Permissions', 0, 'system', -1, 0, 0, 0, -8, 4, 0, 1, 17, 48, 94, 0, 0, 0, 0, 0, 0),
('management', 95, 31, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 0, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 9, 31, 95, 0, 0, 0, 0, 0, 0),
('management', 96, 63, 'admin/config/services/rss-publishing', 'admin/config/services/rss-publishing', 'RSS publishing', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 63, 96, 0, 0, 0, 0, 0, 0),
('management', 97, 50, 'admin/config/regional/settings', 'admin/config/regional/settings', 'Regional settings', 0, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 50, 97, 0, 0, 0, 0, 0, 0),
('management', 98, 48, 'admin/people/permissions/roles', 'admin/people/permissions/roles', 'Roles', 0, 'system', -1, 0, 1, 0, -5, 4, 0, 1, 17, 48, 98, 0, 0, 0, 0, 0, 0),
('management', 99, 46, 'admin/structure/menu/settings', 'admin/structure/menu/settings', 'Settings', 0, 'system', -1, 0, 0, 0, 5, 4, 0, 1, 20, 46, 99, 0, 0, 0, 0, 0, 0),
('management', 100, 53, 'admin/appearance/settings/seven', 'admin/appearance/settings/seven', 'Seven', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 100, 0, 0, 0, 0, 0, 0),
('management', 101, 55, 'admin/config/system/site-information', 'admin/config/system/site-information', 'Site information', 0, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 55, 101, 0, 0, 0, 0, 0, 0),
('management', 102, 53, 'admin/appearance/settings/stark', 'admin/appearance/settings/stark', 'Stark', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 102, 0, 0, 0, 0, 0, 0),
('management', 103, 53, 'admin/appearance/settings/test_theme', 'admin/appearance/settings/test_theme', 'Test theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 103, 0, 0, 0, 0, 0, 0),
('management', 104, 34, 'admin/config/content/formats', 'admin/config/content/formats', 'Text formats', 0, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 34, 104, 0, 0, 0, 0, 0, 0),
('management', 105, 31, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Unapproved comments', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 9, 31, 105, 0, 0, 0, 0, 0, 0),
('management', 106, 59, 'admin/modules/uninstall/confirm', 'admin/modules/uninstall/confirm', 'Uninstall', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 15, 59, 106, 0, 0, 0, 0, 0, 0),
('management', 107, 53, 'admin/appearance/settings/update_test_basetheme', 'admin/appearance/settings/update_test_basetheme', 'Update test base theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 107, 0, 0, 0, 0, 0, 0),
('management', 108, 53, 'admin/appearance/settings/update_test_subtheme', 'admin/appearance/settings/update_test_subtheme', 'Update test subtheme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 108, 0, 0, 0, 0, 0, 0),
('management', 109, 53, 'admin/appearance/settings/websae', 'admin/appearance/settings/websae', 'WebSAE', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 109, 0, 0, 0, 0, 0, 0),
('management', 110, 53, 'admin/appearance/settings/zen', 'admin/appearance/settings/zen', 'Zen', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 110, 0, 0, 0, 0, 0, 0),
('management', 111, 53, 'admin/appearance/settings/mbde', 'admin/appearance/settings/mbde', 'marianbeermann.de Theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 111, 0, 0, 0, 0, 0, 0),
('management', 112, 53, 'admin/appearance/settings/mbde_ds3', 'admin/appearance/settings/mbde_ds3', 'marianbeermann.de Theme (DS3 Seiten)', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 112, 0, 0, 0, 0, 0, 0),
('management', 114, 53, 'admin/appearance/settings/medorathem', 'admin/appearance/settings/medorathem', 'medora.de Theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 53, 114, 0, 0, 0, 0, 0, 0),
('navigation', 115, 39, 'user/%/edit/account', 'user/%/edit/account', 'Account', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 16, 39, 115, 0, 0, 0, 0, 0, 0, 0),
('management', 116, 104, 'admin/config/content/formats/%', 'admin/config/content/formats/%', '', 0, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 34, 104, 116, 0, 0, 0, 0, 0),
('management', 117, 29, 'admin/structure/block/list/acquia_prosper', 'admin/structure/block/list/acquia_prosper', 'Acquia Prosper', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 117, 0, 0, 0, 0, 0, 0),
('management', 119, 104, 'admin/config/content/formats/add', 'admin/config/content/formats/add', 'Add text format', 0, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 34, 104, 119, 0, 0, 0, 0, 0),
('management', 120, 29, 'admin/structure/block/list/bartik', 'admin/structure/block/list/bartik', 'Bartik', 0, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 20, 29, 120, 0, 0, 0, 0, 0, 0),
('management', 121, 69, 'admin/config/system/actions/configure', 'admin/config/system/actions/configure', 'Configure an advanced action', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 55, 69, 121, 0, 0, 0, 0, 0),
('management', 122, 46, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Customize menu', 0, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 20, 46, 122, 0, 0, 0, 0, 0, 0),
('management', 124, 35, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit content type', 0, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 20, 35, 124, 0, 0, 0, 0, 0, 0),
('management', 125, 77, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time/formats', 'Formats', 0, 'system', -1, 0, 1, 0, -9, 5, 0, 1, 8, 50, 77, 125, 0, 0, 0, 0, 0),
('management', 126, 29, 'admin/structure/block/list/fusion_core', 'admin/structure/block/list/fusion_core', 'Fusion Core', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 126, 0, 0, 0, 0, 0, 0),
('management', 127, 29, 'admin/structure/block/list/fusion_starter', 'admin/structure/block/list/fusion_starter', 'Fusion Starter', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 127, 0, 0, 0, 0, 0, 0),
('management', 128, 29, 'admin/structure/block/list/fusion_starter_lite', 'admin/structure/block/list/fusion_starter_lite', 'Fusion Starter Lite', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 128, 0, 0, 0, 0, 0, 0),
('management', 129, 29, 'admin/structure/block/list/garland', 'admin/structure/block/list/garland', 'Garland', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 129, 0, 0, 0, 0, 0, 0),
('management', 130, 104, 'admin/config/content/formats/list', 'admin/config/content/formats/list', 'List', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 34, 104, 130, 0, 0, 0, 0, 0),
('management', 132, 69, 'admin/config/system/actions/manage', 'admin/config/system/actions/manage', 'Manage actions', 0, 'system', -1, 0, 0, 0, -2, 5, 0, 1, 8, 55, 69, 132, 0, 0, 0, 0, 0),
('management', 133, 67, 'admin/config/people/accounts/settings', 'admin/config/people/accounts/settings', 'Settings', 0, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 47, 67, 133, 0, 0, 0, 0, 0),
('management', 134, 29, 'admin/structure/block/list/seven', 'admin/structure/block/list/seven', 'Seven', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 134, 0, 0, 0, 0, 0, 0),
('management', 135, 29, 'admin/structure/block/list/stark', 'admin/structure/block/list/stark', 'Stark', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 135, 0, 0, 0, 0, 0, 0),
('management', 136, 29, 'admin/structure/block/list/test_theme', 'admin/structure/block/list/test_theme', 'Test theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 136, 0, 0, 0, 0, 0, 0),
('management', 137, 77, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time/types', 'Types', 0, 'system', -1, 0, 1, 0, -10, 5, 0, 1, 8, 50, 77, 137, 0, 0, 0, 0, 0),
('management', 138, 29, 'admin/structure/block/list/update_test_basetheme', 'admin/structure/block/list/update_test_basetheme', 'Update test base theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 138, 0, 0, 0, 0, 0, 0),
('management', 139, 29, 'admin/structure/block/list/update_test_subtheme', 'admin/structure/block/list/update_test_subtheme', 'Update test subtheme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 139, 0, 0, 0, 0, 0, 0),
('management', 140, 29, 'admin/structure/block/list/websae', 'admin/structure/block/list/websae', 'WebSAE', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 140, 0, 0, 0, 0, 0, 0),
('management', 141, 29, 'admin/structure/block/list/zen', 'admin/structure/block/list/zen', 'Zen', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 141, 0, 0, 0, 0, 0, 0),
('management', 142, 29, 'admin/structure/block/list/mbde', 'admin/structure/block/list/mbde', 'marianbeermann.de Theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 142, 0, 0, 0, 0, 0, 0),
('management', 143, 29, 'admin/structure/block/list/mbde_ds3', 'admin/structure/block/list/mbde_ds3', 'marianbeermann.de Theme (DS3 Seiten)', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 143, 0, 0, 0, 0, 0, 0),
('management', 144, 29, 'admin/structure/block/list/medorathem', 'admin/structure/block/list/medorathem', 'medora.de Theme', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 29, 144, 0, 0, 0, 0, 0, 0),
('navigation', 145, 51, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 51, 145, 0, 0, 0, 0, 0, 0, 0),
('navigation', 146, 51, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 51, 146, 0, 0, 0, 0, 0, 0, 0),
('navigation', 147, 51, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 51, 147, 0, 0, 0, 0, 0, 0, 0),
('management', 148, 117, 'admin/structure/block/list/acquia_prosper/add', 'admin/structure/block/list/acquia_prosper/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 117, 148, 0, 0, 0, 0, 0),
('management', 149, 126, 'admin/structure/block/list/fusion_core/add', 'admin/structure/block/list/fusion_core/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 126, 149, 0, 0, 0, 0, 0),
('management', 150, 127, 'admin/structure/block/list/fusion_starter/add', 'admin/structure/block/list/fusion_starter/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 127, 150, 0, 0, 0, 0, 0),
('management', 151, 128, 'admin/structure/block/list/fusion_starter_lite/add', 'admin/structure/block/list/fusion_starter_lite/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 128, 151, 0, 0, 0, 0, 0),
('management', 152, 129, 'admin/structure/block/list/garland/add', 'admin/structure/block/list/garland/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 129, 152, 0, 0, 0, 0, 0),
('management', 153, 142, 'admin/structure/block/list/mbde/add', 'admin/structure/block/list/mbde/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 142, 153, 0, 0, 0, 0, 0),
('management', 154, 143, 'admin/structure/block/list/mbde_ds3/add', 'admin/structure/block/list/mbde_ds3/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 143, 154, 0, 0, 0, 0, 0),
('management', 155, 144, 'admin/structure/block/list/medorathem/add', 'admin/structure/block/list/medorathem/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 144, 155, 0, 0, 0, 0, 0),
('management', 156, 134, 'admin/structure/block/list/seven/add', 'admin/structure/block/list/seven/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 134, 156, 0, 0, 0, 0, 0),
('management', 157, 135, 'admin/structure/block/list/stark/add', 'admin/structure/block/list/stark/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 135, 157, 0, 0, 0, 0, 0),
('management', 158, 136, 'admin/structure/block/list/test_theme/add', 'admin/structure/block/list/test_theme/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 136, 158, 0, 0, 0, 0, 0),
('management', 159, 138, 'admin/structure/block/list/update_test_basetheme/add', 'admin/structure/block/list/update_test_basetheme/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 138, 159, 0, 0, 0, 0, 0),
('management', 160, 139, 'admin/structure/block/list/update_test_subtheme/add', 'admin/structure/block/list/update_test_subtheme/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 139, 160, 0, 0, 0, 0, 0),
('management', 161, 140, 'admin/structure/block/list/websae/add', 'admin/structure/block/list/websae/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 140, 161, 0, 0, 0, 0, 0),
('management', 162, 141, 'admin/structure/block/list/zen/add', 'admin/structure/block/list/zen/add', 'Add block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 141, 162, 0, 0, 0, 0, 0),
('management', 163, 137, 'admin/config/regional/date-time/types/add', 'admin/config/regional/date-time/types/add', 'Add date type', 0, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 50, 77, 137, 163, 0, 0, 0, 0),
('management', 164, 125, 'admin/config/regional/date-time/formats/add', 'admin/config/regional/date-time/formats/add', 'Add format', 0, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 50, 77, 125, 164, 0, 0, 0, 0),
('management', 165, 122, 'admin/structure/menu/manage/%/add', 'admin/structure/menu/manage/%/add', 'Add link', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 46, 122, 165, 0, 0, 0, 0, 0),
('management', 166, 29, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 29, 166, 0, 0, 0, 0, 0, 0),
('navigation', 167, 30, 'user/%/cancel/confirm/%/%', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 16, 30, 167, 0, 0, 0, 0, 0, 0, 0),
('management', 168, 124, 'admin/structure/types/manage/%/delete', 'admin/structure/types/manage/%/delete', 'Delete', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 20, 35, 124, 168, 0, 0, 0, 0, 0),
('management', 169, 85, 'admin/config/people/ip-blocking/delete/%', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 47, 85, 169, 0, 0, 0, 0, 0),
('management', 170, 69, 'admin/config/system/actions/delete/%', 'admin/config/system/actions/delete/%', 'Delete action', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 55, 69, 170, 0, 0, 0, 0, 0),
('management', 171, 122, 'admin/structure/menu/manage/%/delete', 'admin/structure/menu/manage/%/delete', 'Delete menu', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 20, 46, 122, 171, 0, 0, 0, 0, 0),
('management', 172, 46, 'admin/structure/menu/item/%/delete', 'admin/structure/menu/item/%/delete', 'Delete menu link', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 172, 0, 0, 0, 0, 0, 0),
('management', 173, 98, 'admin/people/permissions/roles/delete/%', 'admin/people/permissions/roles/delete/%', 'Delete role', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 17, 48, 98, 173, 0, 0, 0, 0, 0),
('management', 174, 116, 'admin/config/content/formats/%/disable', 'admin/config/content/formats/%/disable', 'Disable text format', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 34, 104, 116, 174, 0, 0, 0, 0),
('management', 175, 124, 'admin/structure/types/manage/%/edit', 'admin/structure/types/manage/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 35, 124, 175, 0, 0, 0, 0, 0),
('management', 176, 122, 'admin/structure/menu/manage/%/edit', 'admin/structure/menu/manage/%/edit', 'Edit menu', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 46, 122, 176, 0, 0, 0, 0, 0),
('management', 177, 46, 'admin/structure/menu/item/%/edit', 'admin/structure/menu/item/%/edit', 'Edit menu link', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 177, 0, 0, 0, 0, 0, 0),
('management', 178, 98, 'admin/people/permissions/roles/edit/%', 'admin/people/permissions/roles/edit/%', 'Edit role', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 17, 48, 98, 178, 0, 0, 0, 0, 0),
('management', 179, 122, 'admin/structure/menu/manage/%/list', 'admin/structure/menu/manage/%/list', 'List links', 0, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 20, 46, 122, 179, 0, 0, 0, 0, 0),
('management', 180, 46, 'admin/structure/menu/item/%/reset', 'admin/structure/menu/item/%/reset', 'Reset menu link', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 180, 0, 0, 0, 0, 0, 0),
('management', 181, 124, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%/comment/display', 'Comment display', 0, 'system', -1, 0, 0, 0, 4, 5, 0, 1, 20, 35, 124, 181, 0, 0, 0, 0, 0),
('management', 182, 124, 'admin/structure/types/manage/%/comment/fields', 'admin/structure/types/manage/%/comment/fields', 'Comment fields', 0, 'system', -1, 0, 1, 0, 3, 5, 0, 1, 20, 35, 124, 182, 0, 0, 0, 0, 0),
('management', 183, 166, 'admin/structure/block/manage/%/%/configure', 'admin/structure/block/manage/%/%/configure', 'Configure block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 166, 183, 0, 0, 0, 0, 0),
('management', 184, 166, 'admin/structure/block/manage/%/%/delete', 'admin/structure/block/manage/%/%/delete', 'Delete block', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 29, 166, 184, 0, 0, 0, 0, 0),
('management', 185, 125, 'admin/config/regional/date-time/formats/%/delete', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 50, 77, 125, 185, 0, 0, 0, 0),
('management', 186, 137, 'admin/config/regional/date-time/types/%/delete', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 50, 77, 137, 186, 0, 0, 0, 0),
('management', 187, 125, 'admin/config/regional/date-time/formats/%/edit', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 50, 77, 125, 187, 0, 0, 0, 0),
('management', 188, 46, 'admin/structure/menu/manage/main-menu', 'admin/structure/menu/manage/%', 'Hauptmenü', 0, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 188, 0, 0, 0, 0, 0, 0),
('management', 189, 46, 'admin/structure/menu/manage/management', 'admin/structure/menu/manage/%', 'Management', 0, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 189, 0, 0, 0, 0, 0, 0),
('management', 190, 46, 'admin/structure/menu/manage/navigation', 'admin/structure/menu/manage/%', 'Navigation', 0, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 190, 0, 0, 0, 0, 0, 0),
('management', 191, 46, 'admin/structure/menu/manage/user-menu', 'admin/structure/menu/manage/%', 'User menu', 0, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 20, 46, 191, 0, 0, 0, 0, 0, 0),
('management', 195, 1, 'admin/help', 'admin/help', 'Help', 0, 'system', 0, 0, 0, 0, 9, 2, 0, 1, 195, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 197, 16, 'user/%/shortcuts', 'user/%/shortcuts', 'Shortcuts', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 16, 197, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 200, 195, 'admin/help/block', 'admin/help/block', 'block', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 200, 0, 0, 0, 0, 0, 0, 0),
('management', 201, 195, 'admin/help/color', 'admin/help/color', 'color', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 201, 0, 0, 0, 0, 0, 0, 0),
('management', 202, 195, 'admin/help/comment', 'admin/help/comment', 'comment', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 202, 0, 0, 0, 0, 0, 0, 0),
('management', 203, 195, 'admin/help/contextual', 'admin/help/contextual', 'contextual', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 203, 0, 0, 0, 0, 0, 0, 0),
('management', 204, 195, 'admin/help/dashboard', 'admin/help/dashboard', 'dashboard', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 204, 0, 0, 0, 0, 0, 0, 0),
('management', 205, 195, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 205, 0, 0, 0, 0, 0, 0, 0),
('management', 206, 195, 'admin/help/field', 'admin/help/field', 'field', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 206, 0, 0, 0, 0, 0, 0, 0),
('management', 207, 195, 'admin/help/field_sql_storage', 'admin/help/field_sql_storage', 'field_sql_storage', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 207, 0, 0, 0, 0, 0, 0, 0),
('management', 208, 195, 'admin/help/field_ui', 'admin/help/field_ui', 'field_ui', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 208, 0, 0, 0, 0, 0, 0, 0),
('management', 209, 195, 'admin/help/file', 'admin/help/file', 'file', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 209, 0, 0, 0, 0, 0, 0, 0),
('management', 210, 195, 'admin/help/filter', 'admin/help/filter', 'filter', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 210, 0, 0, 0, 0, 0, 0, 0),
('management', 211, 195, 'admin/help/help', 'admin/help/help', 'help', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 211, 0, 0, 0, 0, 0, 0, 0),
('management', 213, 195, 'admin/help/list', 'admin/help/list', 'list', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 213, 0, 0, 0, 0, 0, 0, 0),
('management', 214, 195, 'admin/help/locale', 'admin/help/locale', 'locale', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 214, 0, 0, 0, 0, 0, 0, 0),
('management', 215, 195, 'admin/help/menu', 'admin/help/menu', 'menu', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 215, 0, 0, 0, 0, 0, 0, 0),
('management', 216, 195, 'admin/help/node', 'admin/help/node', 'node', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 216, 0, 0, 0, 0, 0, 0, 0),
('management', 218, 195, 'admin/help/options', 'admin/help/options', 'options', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 218, 0, 0, 0, 0, 0, 0, 0),
('management', 220, 195, 'admin/help/path', 'admin/help/path', 'path', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 220, 0, 0, 0, 0, 0, 0, 0),
('management', 223, 195, 'admin/help/shortcut', 'admin/help/shortcut', 'shortcut', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 223, 0, 0, 0, 0, 0, 0, 0),
('management', 224, 195, 'admin/help/system', 'admin/help/system', 'system', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 224, 0, 0, 0, 0, 0, 0, 0),
('management', 226, 195, 'admin/help/text', 'admin/help/text', 'text', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 226, 0, 0, 0, 0, 0, 0, 0),
('management', 227, 195, 'admin/help/user', 'admin/help/user', 'user', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 227, 0, 0, 0, 0, 0, 0, 0),
('management', 229, 50, 'admin/config/regional/language', 'admin/config/regional/language', 'Languages', 0, 'system', 0, 0, 1, 0, -10, 4, 0, 1, 8, 50, 229, 0, 0, 0, 0, 0, 0),
('management', 231, 60, 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Shortcuts', 0, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 60, 231, 0, 0, 0, 0, 0, 0);
INSERT INTO 'menu_links' ('menu_name', 'mlid', 'plid', 'link_path', 'router_path', 'link_title', 'options', 'module', 'hidden', 'external', 'has_children', 'expanded', 'weight', 'depth', 'customized', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9', 'updated') VALUES
('management', 232, 50, 'admin/config/regional/translate', 'admin/config/regional/translate', 'Translate interface', 0, 'system', 0, 0, 1, 0, -5, 4, 0, 1, 8, 50, 232, 0, 0, 0, 0, 0, 0),
('management', 233, 52, 'admin/config/search/path', 'admin/config/search/path', 'URL aliases', 0, 'system', 0, 0, 1, 0, -5, 4, 0, 1, 8, 52, 233, 0, 0, 0, 0, 0, 0),
('management', 234, 233, 'admin/config/search/path/add', 'admin/config/search/path/add', 'Add alias', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 52, 233, 234, 0, 0, 0, 0, 0),
('management', 235, 229, 'admin/config/regional/language/add', 'admin/config/regional/language/add', 'Add language', 0, 'system', -1, 0, 0, 0, 5, 5, 0, 1, 8, 50, 229, 235, 0, 0, 0, 0, 0),
('management', 236, 231, 'admin/config/user-interface/shortcut/add-set', 'admin/config/user-interface/shortcut/add-set', 'Add shortcut set', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 60, 231, 236, 0, 0, 0, 0, 0),
('management', 239, 229, 'admin/config/regional/language/configure', 'admin/config/regional/language/configure', 'Detection and selection', 0, 'system', -1, 0, 0, 0, 10, 5, 0, 1, 8, 50, 229, 239, 0, 0, 0, 0, 0),
('management', 240, 231, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 0, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 60, 231, 240, 0, 0, 0, 0, 0),
('management', 241, 232, 'admin/config/regional/translate/export', 'admin/config/regional/translate/export', 'Export', 0, 'system', -1, 0, 0, 0, 30, 5, 0, 1, 8, 50, 232, 241, 0, 0, 0, 0, 0),
('management', 242, 232, 'admin/config/regional/translate/import', 'admin/config/regional/translate/import', 'Import', 0, 'system', -1, 0, 0, 0, 20, 5, 0, 1, 8, 50, 232, 242, 0, 0, 0, 0, 0),
('management', 243, 233, 'admin/config/search/path/list', 'admin/config/search/path/list', 'List', 0, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 52, 233, 243, 0, 0, 0, 0, 0),
('management', 244, 229, 'admin/config/regional/language/overview', 'admin/config/regional/language/overview', 'List', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 50, 229, 244, 0, 0, 0, 0, 0),
('management', 246, 77, 'admin/config/regional/date-time/locale', 'admin/config/regional/date-time/locale', 'Localize', 0, 'system', -1, 0, 1, 0, -8, 5, 0, 1, 8, 50, 77, 246, 0, 0, 0, 0, 0),
('management', 247, 232, 'admin/config/regional/translate/overview', 'admin/config/regional/translate/overview', 'Overview', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 50, 232, 247, 0, 0, 0, 0, 0),
('management', 248, 232, 'admin/config/regional/translate/translate', 'admin/config/regional/translate/translate', 'Translate', 0, 'system', -1, 0, 0, 0, 10, 5, 0, 1, 8, 50, 232, 248, 0, 0, 0, 0, 0),
('management', 249, 240, 'admin/config/user-interface/shortcut/%/add-link', 'admin/config/user-interface/shortcut/%/add-link', 'Add shortcut', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 60, 231, 240, 249, 0, 0, 0, 0),
('management', 250, 229, 'admin/config/regional/language/delete/%', 'admin/config/regional/language/delete/%', 'Confirm', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 50, 229, 250, 0, 0, 0, 0, 0),
('management', 251, 233, 'admin/config/search/path/delete/%', 'admin/config/search/path/delete/%', 'Delete alias', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 52, 233, 251, 0, 0, 0, 0, 0),
('management', 252, 240, 'admin/config/user-interface/shortcut/%/delete', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 60, 231, 240, 252, 0, 0, 0, 0),
('management', 253, 232, 'admin/config/regional/translate/delete/%', 'admin/config/regional/translate/delete/%', 'Delete string', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 50, 232, 253, 0, 0, 0, 0, 0),
('management', 254, 233, 'admin/config/search/path/edit/%', 'admin/config/search/path/edit/%', 'Edit alias', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 52, 233, 254, 0, 0, 0, 0, 0),
('management', 255, 229, 'admin/config/regional/language/edit/%', 'admin/config/regional/language/edit/%', 'Edit language', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 50, 229, 255, 0, 0, 0, 0, 0),
('management', 256, 240, 'admin/config/user-interface/shortcut/%/edit', 'admin/config/user-interface/shortcut/%/edit', 'Edit set name', 0, 'system', -1, 0, 0, 0, 10, 6, 0, 1, 8, 60, 231, 240, 256, 0, 0, 0, 0),
('management', 257, 231, 'admin/config/user-interface/shortcut/link/%', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 0, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 60, 231, 257, 0, 0, 0, 0, 0),
('management', 258, 232, 'admin/config/regional/translate/edit/%', 'admin/config/regional/translate/edit/%', 'Edit string', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 50, 232, 258, 0, 0, 0, 0, 0),
('management', 260, 240, 'admin/config/user-interface/shortcut/%/links', 'admin/config/user-interface/shortcut/%/links', 'List links', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 60, 231, 240, 260, 0, 0, 0, 0),
('management', 261, 239, 'admin/config/regional/language/configure/session', 'admin/config/regional/language/configure/session', 'Session language detection configuration', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 50, 229, 239, 261, 0, 0, 0, 0),
('management', 262, 239, 'admin/config/regional/language/configure/url', 'admin/config/regional/language/configure/url', 'URL language detection configuration', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 50, 229, 239, 262, 0, 0, 0, 0),
('management', 265, 257, 'admin/config/user-interface/shortcut/link/%/delete', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 60, 231, 257, 265, 0, 0, 0, 0),
('management', 266, 246, 'admin/config/regional/date-time/locale/%/edit', 'admin/config/regional/date-time/locale/%/edit', 'Localize date formats', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 50, 77, 246, 266, 0, 0, 0, 0),
('management', 267, 246, 'admin/config/regional/date-time/locale/%/reset', 'admin/config/regional/date-time/locale/%/reset', 'Reset date formats', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 50, 77, 246, 267, 0, 0, 0, 0),
('shortcut-set-1', 271, 0, 'node/add', 'node/add', 'Inhalt hinzufügen', 0, 'menu', 0, 0, 0, 0, -50, 1, 0, 271, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('shortcut-set-1', 272, 0, 'admin/content', 'admin/content', 'Inhalte suchen', 0, 'menu', 0, 0, 0, 0, -49, 1, 0, 272, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 273, 0, '<front>', '', 'Startseite', 0, 'menu', 0, 1, 0, 0, -4, 1, 1, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 274, 6, 'node/add/article', 'node/add/article', 'Artikel', 0, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 274, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 275, 6, 'node/add/page', 'node/add/page', 'Einfache Seite', 0, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 275, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 276, 195, 'admin/help/toolbar', 'admin/help/toolbar', 'toolbar', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 276, 0, 0, 0, 0, 0, 0, 0),
('management', 315, 18, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 0, 'system', 0, 0, 0, 0, -50, 3, 0, 1, 18, 315, 0, 0, 0, 0, 0, 0, 0),
('management', 316, 15, 'admin/modules/install', 'admin/modules/install', 'Install new module', 0, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 15, 316, 0, 0, 0, 0, 0, 0, 0),
('management', 317, 7, 'admin/appearance/install', 'admin/appearance/install', 'Install new theme', 0, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 7, 317, 0, 0, 0, 0, 0, 0, 0),
('management', 318, 15, 'admin/modules/update', 'admin/modules/update', 'Update', 0, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 15, 318, 0, 0, 0, 0, 0, 0, 0),
('management', 319, 7, 'admin/appearance/update', 'admin/appearance/update', 'Update', 0, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 7, 319, 0, 0, 0, 0, 0, 0, 0),
('management', 320, 195, 'admin/help/update', 'admin/help/update', 'update', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 320, 0, 0, 0, 0, 0, 0, 0),
('management', 321, 315, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 18, 315, 321, 0, 0, 0, 0, 0, 0),
('management', 322, 315, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 0, 'system', -1, 0, 0, 0, 50, 4, 0, 1, 18, 315, 322, 0, 0, 0, 0, 0, 0),
('management', 323, 315, 'admin/reports/updates/install', 'admin/reports/updates/install', 'Install new module or theme', 0, 'system', -1, 0, 0, 0, 25, 4, 0, 1, 18, 315, 323, 0, 0, 0, 0, 0, 0),
('management', 324, 315, 'admin/reports/updates/update', 'admin/reports/updates/update', 'Update', 0, 'system', -1, 0, 0, 0, 10, 4, 0, 1, 18, 315, 324, 0, 0, 0, 0, 0, 0),
('management', 326, 67, 'admin/config/people/accounts/display', 'admin/config/people/accounts/display', 'Manage display', 0, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 47, 67, 326, 0, 0, 0, 0, 0),
('management', 328, 67, 'admin/config/people/accounts/fields', 'admin/config/people/accounts/fields', 'Manage fields', 0, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 8, 47, 67, 328, 0, 0, 0, 0, 0),
('management', 329, 326, 'admin/config/people/accounts/display/full', 'admin/config/people/accounts/display/full', 'Benutzerkonto', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 47, 67, 326, 329, 0, 0, 0, 0),
('management', 330, 124, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%/display', 'Manage display', 0, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 20, 35, 124, 330, 0, 0, 0, 0, 0),
('management', 331, 124, 'admin/structure/types/manage/%/fields', 'admin/structure/types/manage/%/fields', 'Manage fields', 0, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 20, 35, 124, 331, 0, 0, 0, 0, 0),
('management', 334, 326, 'admin/config/people/accounts/display/default', 'admin/config/people/accounts/display/default', 'Standard', 0, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 47, 67, 326, 334, 0, 0, 0, 0),
('management', 335, 328, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', '', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 47, 67, 328, 335, 0, 0, 0, 0),
('management', 337, 330, 'admin/structure/types/manage/%/display/teaser', 'admin/structure/types/manage/%/display/teaser', 'Anrisstext', 0, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 20, 35, 124, 330, 337, 0, 0, 0, 0),
('management', 338, 330, 'admin/structure/types/manage/%/display/rss', 'admin/structure/types/manage/%/display/rss', 'RSS', 0, 'system', -1, 0, 0, 0, 2, 6, 0, 1, 20, 35, 124, 330, 338, 0, 0, 0, 0),
('management', 339, 330, 'admin/structure/types/manage/%/display/default', 'admin/structure/types/manage/%/display/default', 'Standard', 0, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 20, 35, 124, 330, 339, 0, 0, 0, 0),
('management', 342, 330, 'admin/structure/types/manage/%/display/full', 'admin/structure/types/manage/%/display/full', 'Vollständiger-Inhalt', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 20, 35, 124, 330, 342, 0, 0, 0, 0),
('management', 343, 331, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', '', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 20, 35, 124, 331, 343, 0, 0, 0, 0),
('management', 348, 335, 'admin/config/people/accounts/fields/%/delete', 'admin/config/people/accounts/fields/%/delete', 'Delete', 0, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 8, 47, 67, 328, 335, 348, 0, 0, 0),
('management', 349, 335, 'admin/config/people/accounts/fields/%/edit', 'admin/config/people/accounts/fields/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 47, 67, 328, 335, 349, 0, 0, 0),
('management', 350, 335, 'admin/config/people/accounts/fields/%/field-settings', 'admin/config/people/accounts/fields/%/field-settings', 'Field settings', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 47, 67, 328, 335, 350, 0, 0, 0),
('management', 351, 335, 'admin/config/people/accounts/fields/%/widget-type', 'admin/config/people/accounts/fields/%/widget-type', 'Widget type', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 47, 67, 328, 335, 351, 0, 0, 0),
('management', 352, 181, 'admin/structure/types/manage/%/comment/display/full', 'admin/structure/types/manage/%/comment/display/full', 'Kompletter Kommentar', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 20, 35, 124, 181, 352, 0, 0, 0, 0),
('management', 353, 181, 'admin/structure/types/manage/%/comment/display/default', 'admin/structure/types/manage/%/comment/display/default', 'Standard', 0, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 20, 35, 124, 181, 353, 0, 0, 0, 0),
('management', 354, 182, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', '', 0, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 20, 35, 124, 182, 354, 0, 0, 0, 0),
('management', 355, 343, 'admin/structure/types/manage/%/fields/%/edit', 'admin/structure/types/manage/%/fields/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 20, 35, 124, 331, 343, 355, 0, 0, 0),
('management', 356, 343, 'admin/structure/types/manage/%/fields/%/delete', 'admin/structure/types/manage/%/fields/%/delete', 'Delete', 0, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 20, 35, 124, 331, 343, 356, 0, 0, 0),
('management', 357, 343, 'admin/structure/types/manage/%/fields/%/field-settings', 'admin/structure/types/manage/%/fields/%/field-settings', 'Field settings', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 20, 35, 124, 331, 343, 357, 0, 0, 0),
('management', 358, 343, 'admin/structure/types/manage/%/fields/%/widget-type', 'admin/structure/types/manage/%/fields/%/widget-type', 'Widget type', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 20, 35, 124, 331, 343, 358, 0, 0, 0),
('management', 359, 354, 'admin/structure/types/manage/%/comment/fields/%/delete', 'admin/structure/types/manage/%/comment/fields/%/delete', 'Delete', 0, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 20, 35, 124, 182, 354, 359, 0, 0, 0),
('management', 360, 354, 'admin/structure/types/manage/%/comment/fields/%/edit', 'admin/structure/types/manage/%/comment/fields/%/edit', 'Edit', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 20, 35, 124, 182, 354, 360, 0, 0, 0),
('management', 361, 354, 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'Field settings', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 20, 35, 124, 182, 354, 361, 0, 0, 0),
('management', 362, 354, 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'Widget type', 0, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 20, 35, 124, 182, 354, 362, 0, 0, 0),
('navigation', 363, 5, 'node/%/children', 'node/%/children', 'Children', 0, 'system', -1, 0, 0, 0, 5, 2, 0, 5, 363, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 364, 8, 'admin/config/nodehierarchy', 'admin/config/nodehierarchy', 'Node Hierarchy', 0, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 8, 364, 0, 0, 0, 0, 0, 0, 0),
('management', 365, 195, 'admin/help/geshifilter', 'admin/help/geshifilter', 'geshifilter', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 365, 0, 0, 0, 0, 0, 0, 0),
('management', 366, 195, 'admin/help/nodehierarchy', 'admin/help/nodehierarchy', 'nodehierarchy', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 366, 0, 0, 0, 0, 0, 0, 0),
('management', 367, 104, 'admin/config/content/formats/geshifilter', 'admin/config/content/formats/geshifilter', 'GeSHi Filter', 0, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 34, 104, 367, 0, 0, 0, 0, 0),
('management', 368, 367, 'admin/config/content/formats/geshifilter/filterconflicts', 'admin/config/content/formats/geshifilter/filterconflicts', 'Filter conflicts', 0, 'system', -1, 0, 0, 0, 10, 6, 0, 1, 8, 34, 104, 367, 368, 0, 0, 0, 0),
('management', 369, 367, 'admin/config/content/formats/geshifilter/general', 'admin/config/content/formats/geshifilter/general', 'General settings', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 34, 104, 367, 369, 0, 0, 0, 0),
('management', 370, 367, 'admin/config/content/formats/geshifilter/languages', 'admin/config/content/formats/geshifilter/languages', 'Languages', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 34, 104, 367, 370, 0, 0, 0, 0),
('management', 371, 370, 'admin/config/content/formats/geshifilter/languages/all', 'admin/config/content/formats/geshifilter/languages/all', 'All', 0, 'system', -1, 0, 0, 0, 1, 7, 0, 1, 8, 34, 104, 367, 370, 371, 0, 0, 0),
('management', 372, 370, 'admin/config/content/formats/geshifilter/languages/disabled', 'admin/config/content/formats/geshifilter/languages/disabled', 'Disabled', 0, 'system', -1, 0, 0, 0, 6, 7, 0, 1, 8, 34, 104, 367, 370, 372, 0, 0, 0),
('management', 373, 370, 'admin/config/content/formats/geshifilter/languages/enabled', 'admin/config/content/formats/geshifilter/languages/enabled', 'Enabled', 0, 'system', -1, 0, 0, 0, 3, 7, 0, 1, 8, 34, 104, 367, 370, 373, 0, 0, 0),
('shortcut-set-1', 374, 0, 'node/add/page', 'node/add/page', 'Einfache Seite', 0, 'menu', 0, 0, 0, 0, -48, 1, 0, 374, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 375, 0, 'node/1', 'node/%', 'Queries', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 1, 0, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 376, 375, 'node/2', 'node/%', 'bookmarks.php', 0, 'nodehierarchy', 1, 0, 0, 0, -50, 2, 0, 375, 376, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 377, 20, 'admin/structure/views', 'admin/structure/views', 'Views', 0, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 20, 377, 0, 0, 0, 0, 0, 0, 0),
('management', 378, 377, 'admin/structure/views/add', 'admin/structure/views/add', 'Add new view', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 377, 378, 0, 0, 0, 0, 0, 0),
('management', 379, 377, 'admin/structure/views/add-template', 'admin/structure/views/add-template', 'Add view from template', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 377, 379, 0, 0, 0, 0, 0, 0),
('management', 380, 377, 'admin/structure/views/import', 'admin/structure/views/import', 'Import', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 377, 380, 0, 0, 0, 0, 0, 0),
('management', 381, 377, 'admin/structure/views/list', 'admin/structure/views/list', 'List', 0, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 20, 377, 381, 0, 0, 0, 0, 0, 0),
('management', 382, 377, 'admin/structure/views/settings', 'admin/structure/views/settings', 'Settings', 0, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 20, 377, 382, 0, 0, 0, 0, 0, 0),
('management', 383, 382, 'admin/structure/views/settings/advanced', 'admin/structure/views/settings/advanced', 'Advanced', 0, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 20, 377, 382, 383, 0, 0, 0, 0, 0),
('management', 384, 382, 'admin/structure/views/settings/basic', 'admin/structure/views/settings/basic', 'Basic', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 377, 382, 384, 0, 0, 0, 0, 0),
('management', 385, 377, 'admin/structure/views/view/%', 'admin/structure/views/view/%', '', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 377, 385, 0, 0, 0, 0, 0, 0),
('management', 386, 385, 'admin/structure/views/view/%/break-lock', 'admin/structure/views/view/%/break-lock', 'Break lock', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 377, 385, 386, 0, 0, 0, 0, 0),
('management', 387, 385, 'admin/structure/views/view/%/edit', 'admin/structure/views/view/%/edit', 'Edit view', 0, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 20, 377, 385, 387, 0, 0, 0, 0, 0),
('management', 388, 385, 'admin/structure/views/view/%/clone', 'admin/structure/views/view/%/clone', 'Clone', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 377, 385, 388, 0, 0, 0, 0, 0),
('management', 389, 385, 'admin/structure/views/view/%/delete', 'admin/structure/views/view/%/delete', 'Delete', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 377, 385, 389, 0, 0, 0, 0, 0),
('management', 390, 385, 'admin/structure/views/view/%/export', 'admin/structure/views/view/%/export', 'Export', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 377, 385, 390, 0, 0, 0, 0, 0),
('management', 391, 385, 'admin/structure/views/view/%/revert', 'admin/structure/views/view/%/revert', 'Revert', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 20, 377, 385, 391, 0, 0, 0, 0, 0),
('management', 392, 377, 'admin/structure/views/nojs/preview/%/%', 'admin/structure/views/nojs/preview/%/%', '', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 377, 392, 0, 0, 0, 0, 0, 0),
('management', 393, 377, 'admin/structure/views/ajax/preview/%/%', 'admin/structure/views/ajax/preview/%/%', '', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 20, 377, 393, 0, 0, 0, 0, 0, 0),
('management', 394, 55, 'admin/config/system/boost', 'admin/config/system/boost', 'Boost', 0, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 55, 394, 0, 0, 0, 0, 0, 0),
('management', 395, 394, 'admin/config/system/boost/htaccess', 'admin/config/system/boost/htaccess', '.htaccess', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 55, 394, 395, 0, 0, 0, 0, 0),
('management', 396, 394, 'admin/config/system/boost/default', 'admin/config/system/boost/default', 'Boost Settings', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 55, 394, 396, 0, 0, 0, 0, 0),
('management', 397, 394, 'admin/config/system/boost/expiration', 'admin/config/system/boost/expiration', 'Cache Expiration', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 55, 394, 397, 0, 0, 0, 0, 0),
('management', 398, 394, 'admin/config/system/boost/debug', 'admin/config/system/boost/debug', 'Debug', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 55, 394, 398, 0, 0, 0, 0, 0),
('management', 399, 394, 'admin/config/system/boost/filesystem', 'admin/config/system/boost/filesystem', 'File System', 0, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 55, 394, 399, 0, 0, 0, 0, 0),
('management', 400, 395, 'admin/config/system/boost/htaccess/generator', 'admin/config/system/boost/htaccess/generator', '.htaccess Generation', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 55, 394, 395, 400, 0, 0, 0, 0),
('management', 401, 395, 'admin/config/system/boost/htaccess/default', 'admin/config/system/boost/htaccess/default', '.htaccess Settings', 0, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 55, 394, 395, 401, 0, 0, 0, 0),
('navigation', 402, 375, 'node/3', 'node/%', 'Login', 0, 'nodehierarchy', 1, 0, 0, 0, -45, 2, 0, 375, 402, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 403, 6, 'node/add/parameter', 'node/add/parameter', 'Parameter', 0, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 403, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 404, 402, 'node/4', 'node/%', 'login_username', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 402, 404, 0, 0, 0, 0, 0, 0, 0),
('navigation', 405, 402, 'node/5', 'node/%', 'login_password', 0, 'nodehierarchy', 1, 0, 0, 0, 1, 3, 0, 375, 402, 405, 0, 0, 0, 0, 0, 0, 0),
('navigation', 406, 402, 'node/6', 'node/%', 'login_lifetime', 0, 'nodehierarchy', 1, 0, 0, 0, 2, 3, 0, 375, 402, 406, 0, 0, 0, 0, 0, 0, 0),
('navigation', 407, 375, 'node/7', 'node/%', 'Logout', 0, 'nodehierarchy', 1, 0, 0, 0, -44, 2, 0, 375, 407, 0, 0, 0, 0, 0, 0, 0, 0),
('shortcut-set-1', 408, 0, 'node/add/parameter', 'node/add/parameter', 'Para', 0, 'menu', 0, 0, 0, 0, -47, 1, 0, 408, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 409, 407, 'node/8', 'node/%', 'UID', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 407, 409, 0, 0, 0, 0, 0, 0, 0),
('navigation', 410, 407, 'node/9', 'node/%', 'a', 0, 'nodehierarchy', 1, 0, 0, 0, 1, 3, 0, 375, 407, 410, 0, 0, 0, 0, 0, 0, 0),
('navigation', 411, 375, 'node/10', 'node/%', 'boards.php', 0, 'nodehierarchy', 1, 0, 0, 0, -49, 2, 0, 375, 411, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 412, 195, 'admin/help/pathauto', 'admin/help/pathauto', 'pathauto', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 412, 0, 0, 0, 0, 0, 0, 0),
('management', 413, 195, 'admin/help/token', 'admin/help/token', 'token', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 413, 0, 0, 0, 0, 0, 0, 0),
('management', 414, 233, 'admin/config/search/path/update_bulk', 'admin/config/search/path/update_bulk', 'Bulk update', 0, 'system', -1, 0, 0, 0, 30, 5, 0, 1, 8, 52, 233, 414, 0, 0, 0, 0, 0),
('management', 415, 233, 'admin/config/search/path/delete_bulk', 'admin/config/search/path/delete_bulk', 'Delete aliases', 0, 'system', -1, 0, 0, 0, 40, 5, 0, 1, 8, 52, 233, 415, 0, 0, 0, 0, 0),
('management', 416, 233, 'admin/config/search/path/patterns', 'admin/config/search/path/patterns', 'Patterns', 0, 'system', -1, 0, 0, 0, 10, 5, 0, 1, 8, 52, 233, 416, 0, 0, 0, 0, 0),
('management', 417, 233, 'admin/config/search/path/settings', 'admin/config/search/path/settings', 'Settings', 0, 'system', -1, 0, 0, 0, 20, 5, 0, 1, 8, 52, 233, 417, 0, 0, 0, 0, 0),
('main-menu', 418, 0, 'node/1', 'node/%', 'Queries', 0, 'menu', 0, 0, 0, 0, 0, 1, 1, 418, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('shortcut-set-1', 419, 0, 'admin/structure/menu/manage/main-menu', 'admin/structure/menu/manage/%', 'Hauptmenü', 0, 'menu', 0, 0, 0, 0, -46, 1, 0, 419, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 420, 375, 'node/12', 'node/%', 'thread.php', 0, 'nodehierarchy', 1, 0, 0, 0, -47, 2, 0, 375, 420, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 421, 420, 'node/13', 'node/%', 'TID', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 420, 421, 0, 0, 0, 0, 0, 0, 0),
('navigation', 422, 420, 'node/14', 'node/%', 'PID', 0, 'nodehierarchy', 1, 0, 0, 0, 1, 3, 0, 375, 420, 422, 0, 0, 0, 0, 0, 0, 0),
('navigation', 423, 420, 'node/15', 'node/%', 'page', 0, 'nodehierarchy', 1, 0, 0, 0, 2, 3, 0, 375, 420, 423, 0, 0, 0, 0, 0, 0, 0),
('navigation', 424, 420, 'node/16', 'node/%', 'temp', 0, 'nodehierarchy', 1, 0, 0, 0, 3, 3, 0, 375, 420, 424, 0, 0, 0, 0, 0, 0, 0),
('navigation', 425, 420, 'node/17', 'node/%', 'offset', 0, 'nodehierarchy', 1, 0, 0, 0, 4, 3, 0, 375, 420, 425, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 426, 0, 'node/18', 'node/%', 'Applikationen', 0, 'menu', 0, 0, 0, 0, 13, 1, 0, 426, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 427, 0, 'tracker', 'tracker', 'Recent content', 0, 'system', 0, 0, 0, 0, 1, 1, 0, 427, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 428, 427, 'tracker/all', 'tracker/all', 'All recent content', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 427, 428, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 429, 427, 'tracker/%', 'tracker/%', 'My recent content', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 427, 429, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 435, 16, 'user/%/track', 'user/%/track', 'Track', 0, 'system', -1, 0, 0, 0, 0, 2, 0, 16, 435, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 437, 195, 'admin/help/tracker', 'admin/help/tracker', 'tracker', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 195, 437, 0, 0, 0, 0, 0, 0, 0),
('navigation', 440, 435, 'user/%/track/content', 'user/%/track/content', 'Track content', 0, 'system', -1, 0, 0, 0, 0, 3, 0, 16, 435, 440, 0, 0, 0, 0, 0, 0, 0),
('navigation', 442, 420, 'node/19', 'node/%', 'onlyPID', 0, 'nodehierarchy', 1, 0, 0, 0, 5, 3, 0, 375, 420, 442, 0, 0, 0, 0, 0, 0, 0),
('navigation', 443, 420, 'node/20', 'node/%', 'update_bookmark', 0, 'nodehierarchy', 1, 0, 0, 0, 6, 3, 0, 375, 420, 443, 0, 0, 0, 0, 0, 0, 0),
('navigation', 444, 375, 'node/21', 'node/%', 'board.php', 0, 'nodehierarchy', 1, 0, 0, 0, -48, 2, 0, 375, 444, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 445, 444, 'node/22', 'node/%', 'offset', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 444, 445, 0, 0, 0, 0, 0, 0, 0),
('navigation', 446, 444, 'node/23', 'node/%', 'with-globals', 0, 'nodehierarchy', 1, 0, 0, 0, 1, 3, 0, 375, 444, 446, 0, 0, 0, 0, 0, 0, 0),
('navigation', 447, 444, 'node/24', 'node/%', 'with-stickies', 0, 'nodehierarchy', 1, 0, 0, 0, 2, 3, 0, 375, 444, 447, 0, 0, 0, 0, 0, 0, 0),
('navigation', 448, 375, 'node/25', 'node/%', 'settings.php', 0, 'nodehierarchy', 1, 0, 0, 0, -46, 2, 0, 375, 448, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 449, 444, 'node/26', 'node/%', 'BID', 0, 'nodehierarchy', 1, 0, 0, 0, 3, 3, 0, 375, 444, 449, 0, 0, 0, 0, 0, 0, 0),
('navigation', 450, 375, 'node/27', 'node/%', 'newreply.php', 0, 'nodehierarchy', 1, 0, 0, 0, -43, 2, 0, 375, 450, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 451, 450, 'node/28', 'node/%', 'TID', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 450, 451, 0, 0, 0, 0, 0, 0, 0),
('navigation', 452, 450, 'node/29', 'node/%', 'SID', 0, 'nodehierarchy', 1, 0, 0, 0, 1, 3, 0, 375, 450, 452, 0, 0, 0, 0, 0, 0, 0),
('navigation', 454, 450, 'node/31', 'node/%', 'token', 0, 'nodehierarchy', 1, 0, 0, 0, 3, 3, 0, 375, 450, 454, 0, 0, 0, 0, 0, 0, 0),
('navigation', 455, 450, 'node/32', 'node/%', 'post_title', 0, 'nodehierarchy', 1, 0, 0, 0, 4, 3, 0, 375, 450, 455, 0, 0, 0, 0, 0, 0, 0),
('navigation', 456, 450, 'node/33', 'node/%', 'message', 0, 'nodehierarchy', 1, 0, 0, 0, 5, 3, 0, 375, 450, 456, 0, 0, 0, 0, 0, 0, 0),
('navigation', 457, 450, 'node/34', 'node/%', 'post_converturls', 0, 'nodehierarchy', 1, 0, 0, 0, 6, 3, 0, 375, 450, 457, 0, 0, 0, 0, 0, 0, 0),
('navigation', 458, 450, 'node/35', 'node/%', 'post_disablebbcode', 0, 'nodehierarchy', 1, 0, 0, 0, 7, 3, 0, 375, 450, 458, 0, 0, 0, 0, 0, 0, 0),
('navigation', 459, 450, 'node/36', 'node/%', 'post_disablesmilies', 0, 'nodehierarchy', 1, 0, 0, 0, 8, 3, 0, 375, 450, 459, 0, 0, 0, 0, 0, 0, 0),
('navigation', 460, 450, 'node/37', 'node/%', 'submit', 0, 'nodehierarchy', 1, 0, 0, 0, 9, 3, 0, 375, 450, 460, 0, 0, 0, 0, 0, 0, 0),
('navigation', 461, 450, 'node/38', 'node/%', 'post_icon', 0, 'nodehierarchy', 1, 0, 0, 0, 10, 3, 0, 375, 450, 461, 0, 0, 0, 0, 0, 0, 0),
('navigation', 462, 375, 'node/39', 'node/%', 'newthread.php', 0, 'nodehierarchy', 1, 0, 0, 0, -42, 2, 0, 375, 462, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 463, 462, 'node/40', 'node/%', 'thread_title', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 462, 463, 0, 0, 0, 0, 0, 0, 0),
('navigation', 464, 462, 'node/41', 'node/%', 'thread_subtitle', 0, 'nodehierarchy', 1, 0, 0, 0, 1, 3, 0, 375, 462, 464, 0, 0, 0, 0, 0, 0, 0),
('navigation', 465, 462, 'node/42', 'node/%', 'thread_tags', 0, 'nodehierarchy', 1, 0, 0, 0, 2, 3, 0, 375, 462, 465, 0, 0, 0, 0, 0, 0, 0),
('navigation', 466, 462, 'node/43', 'node/%', 'BID', 0, 'nodehierarchy', 1, 0, 0, 0, 3, 3, 0, 375, 462, 466, 0, 0, 0, 0, 0, 0, 0),
('navigation', 467, 375, 'node/44', 'node/%', 'editreply.php', 0, 'nodehierarchy', 1, 0, 0, 0, -41, 2, 0, 375, 467, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 468, 467, 'node/45', 'node/%', 'PID', 0, 'nodehierarchy', 1, 0, 0, 0, 0, 3, 0, 375, 467, 468, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 469, 0, 'node/46', 'node/%', 'Identifikatoren', 0, 'menu', 0, 0, 0, 0, 1, 1, 0, 469, 0, 0, 0, 0, 0, 0, 0, 0, 0);
