<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# 40ants-bots - Framework for build products around chat bots. Includes bot DSL and admin interface for interacting with bot users.

<a id="40-ants-bots-asdf-system-details"></a>

## 40ANTS-BOTS ASDF System Details

* Description: Framework for build products around chat bots. Includes bot `DSL` and admin interface for interacting with bot users.
* Licence: Unlicense
* Author: Alexander Artemenko <svetlyak.40wt@gmail.com>
* Homepage: [https://40ants.com/bots/][6a9f]
* Bug tracker: [https://github.com/40ants/bots/issues][4d50]
* Source control: [GIT][cd41]
* Depends on: [40ants-doc][2c00], [alexandria][8236], [cl-telegram-bot2][4426], [dbd-postgres][0b29], [mito][5b70], [serapeum][c41d], [sxql][2efd]

[![](https://github-actions.40ants.com/40ants/bots/matrix.svg?only=ci.run-tests)][fbfc]

![](http://quickdocs.org/badge/40ants-bots.svg)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-40INSTALLATION-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Installation

You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :40ants-bots)
```
<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-40USAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Usage

`TODO`: Write a library description. Put some examples here.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-40API-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## API

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS

<a id="x-28-23A-28-2811-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-22-29-20PACKAGE-29"></a>

#### [package](aee8) `40ants-bots`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-24HELLO-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### HELLO

<a id="x-2840ANTS-BOTS-3AHELLO-20CLASS-29"></a>

###### [class](7e2b) `40ants-bots:hello` ()

Example class.

**Readers**

<a id="x-2840ANTS-BOTS-3AUSER-NAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-3AHELLO-29-29"></a>

###### [reader](eb27) `40ants-bots:user-name` (hello) (:name)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-3FGenerics-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Generics

<a id="x-2840ANTS-BOTS-3ASAY-20GENERIC-FUNCTION-29"></a>

##### [generic-function](520c) `40ants-bots:say` obj

Say what should be said.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-3AMAKE-HELLO-20FUNCTION-29"></a>

##### [function](a044) `40ants-bots:make-hello` name

Makes hello world example

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FBOT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/BOT

<a id="x-28-23A-28-2815-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FBOT-22-29-20PACKAGE-29"></a>

#### [package](fcce) `40ants-bots/bot`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FBOT-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FBOT-24BOT-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### BOT

<a id="x-2840ANTS-BOTS-2FBOT-3ABOT-20CLASS-29"></a>

###### [class](688c) `40ants-bots/bot:bot` ()

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FCHAT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/CHAT

<a id="x-28-23A-28-2828-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FCHAT-22-29-20PACKAGE-29"></a>

#### [package](1d9d) `40ants-bots/controllers/chat`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FCHAT-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3ACREATE-CHAT-20FUNCTION-29"></a>

##### [function](0f3e) `40ants-bots/controllers/chat:create-chat` platform platform-id &key (type :chat) raw

Создает новый чат в базе данных.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CHAT-BY-ID-20FUNCTION-29"></a>

##### [function](1fcf) `40ants-bots/controllers/chat:get-chat-by-id` id

Возвращает чат по его `ID`.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CHAT-BY-PLATFORM-ID-20FUNCTION-29"></a>

##### [function](f387) `40ants-bots/controllers/chat:get-chat-by-platform-id` platform platform-id &optional (type :chat)

Находит чат по platform, platform-id и type.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CHAT-TITLE-20FUNCTION-29"></a>

##### [function](83a0) `40ants-bots/controllers/chat:get-chat-title` chat

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CURRENT-CHAT-20FUNCTION-29"></a>

##### [function](6be3) `40ants-bots/controllers/chat:get-current-chat`

Возвращает текущий активный чат из переменной *current-chat*.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-OR-CREATE-CHAT-20FUNCTION-29"></a>

##### [function](71ed) `40ants-bots/controllers/chat:get-or-create-chat` platform platform-id &key (type :chat) raw

Находит или создает чат по platform, platform-id и type.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-PRIVATE-CHAT-20FUNCTION-29"></a>

##### [function](ea5c) `40ants-bots/controllers/chat:get-private-chat` user

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3ALIST-CHATS-20FUNCTION-29"></a>

##### [function](77bd) `40ants-bots/controllers/chat:list-chats` &key (limit 100) (offset 0)

Возвращает список чатов с пагинацией.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/MESSAGE

<a id="x-28-23A-28-2831-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-22-29-20PACKAGE-29"></a>

#### [package](59f1) `40ants-bots/controllers/message`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3ACREATE-MESSAGE-20FUNCTION-29"></a>

##### [function](ee43) `40ants-bots/controllers/message:create-message` platform platform-id chat user text &key raw (incomingp nil)

Создает новое сообщение в базе данных.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3AGET-MESSAGE-20FUNCTION-29"></a>

##### [function](3e73) `40ants-bots/controllers/message:get-message` id

Возвращает сообщение по его `ID`.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3ALIST-MESSAGES-20FUNCTION-29"></a>

##### [function](f902) `40ants-bots/controllers/message:list-messages` &key (limit 100) (offset 0)

Возвращает список сообщений с пагинацией.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FUSER-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/USER

<a id="x-28-23A-28-2828-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FUSER-22-29-20PACKAGE-29"></a>

#### [package](7c67) `40ants-bots/controllers/user`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FUSER-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3ACREATE-USER-20FUNCTION-29"></a>

##### [function](c6ce) `40ants-bots/controllers/user:create-user` platform platform-id username raw

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3AGET-CURRENT-USER-20FUNCTION-29"></a>

##### [function](6398) `40ants-bots/controllers/user:get-current-user`

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3AGET-OR-CREATE-USER-20FUNCTION-29"></a>

##### [function](bd21) `40ants-bots/controllers/user:get-or-create-user` platform platform-id username raw

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3AGET-USER-20FUNCTION-29"></a>

##### [function](1e93) `40ants-bots/controllers/user:get-user` platform platform-id

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FDB-2FUTILS-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/DB/UTILS

<a id="x-28-23A-28-2820-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FDB-2FUTILS-22-29-20PACKAGE-29"></a>

#### [package](f5e3) `40ants-bots/db/utils`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FDB-2FUTILS-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AHASH-FROM-DB-20FUNCTION-29"></a>

##### [function](45fb) `40ants-bots/db/utils:hash-from-db` value

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AHASH-TO-DB-20FUNCTION-29"></a>

##### [function](0d78) `40ants-bots/db/utils:hash-to-db` value

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AKEYWORD-FROM-DB-20FUNCTION-29"></a>

##### [function](d4d1) `40ants-bots/db/utils:keyword-from-db` value

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AKEYWORD-TO-DB-20FUNCTION-29"></a>

##### [function](e956) `40ants-bots/db/utils:keyword-to-db` value

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FCHAT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/CHAT

<a id="x-28-23A-28-2823-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FCHAT-22-29-20PACKAGE-29"></a>

#### [package](70a8) `40ants-bots/models/chat`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FCHAT-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FCHAT-24CHAT-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### CHAT

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-20CLASS-29"></a>

###### [class](3a96) `40ants-bots/models/chat:chat` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](0428) `40ants-bots/models/chat:chat-platform` (chat) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](a477) `40ants-bots/models/chat:chat-platform-id` (chat) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](c146) `40ants-bots/models/chat:chat-raw` (chat) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](ce5b) `40ants-bots/models/chat:chat-type` (chat) (:type = :chat)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](0428) `40ants-bots/models/chat:chat-platform` (chat) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](a477) `40ants-bots/models/chat:chat-platform-id` (chat) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](c146) `40ants-bots/models/chat:chat-raw` (chat) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](ce5b) `40ants-bots/models/chat:chat-type` (chat) (:type = :chat)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FMESSAGE-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/MESSAGE

<a id="x-28-23A-28-2826-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FMESSAGE-22-29-20PACKAGE-29"></a>

#### [package](c323) `40ants-bots/models/message`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FMESSAGE-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FMESSAGE-24MESSAGE-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### MESSAGE

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-20CLASS-29"></a>

###### [class](2482) `40ants-bots/models/message:message` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](2482) `40ants-bots/models/message:message-chat` (message) (:chat)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](2482) `40ants-bots/models/message:message-chat-id` (message) (:chat-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-INCOMING-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](abc9) `40ants-bots/models/message:message-incoming` (message) (:incoming :incomingp)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](4a9f) `40ants-bots/models/message:message-platform` (message) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](48c7) `40ants-bots/models/message:message-platform-id` (message) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](f7bd) `40ants-bots/models/message:message-raw` (message) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-TEXT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](50d4) `40ants-bots/models/message:message-text` (message) (:text)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](2482) `40ants-bots/models/message:message-user` (message) (:user)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](2482) `40ants-bots/models/message:message-user-id` (message) (:user-id)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](2482) `40ants-bots/models/message:message-chat` (message) (:chat)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](2482) `40ants-bots/models/message:message-chat-id` (message) (:chat-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-INCOMING-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](abc9) `40ants-bots/models/message:message-incoming` (message) (:incoming :incomingp)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](4a9f) `40ants-bots/models/message:message-platform` (message) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](48c7) `40ants-bots/models/message:message-platform-id` (message) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](f7bd) `40ants-bots/models/message:message-raw` (message) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-TEXT-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](50d4) `40ants-bots/models/message:message-text` (message) (:text)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](2482) `40ants-bots/models/message:message-user` (message) (:user)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](2482) `40ants-bots/models/message:message-user-id` (message) (:user-id)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FUSER-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/USER

<a id="x-28-23A-28-2823-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FUSER-22-29-20PACKAGE-29"></a>

#### [package](c65b) `40ants-bots/models/user`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FUSER-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FUSER-24USER-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### USER

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-20CLASS-29"></a>

###### [class](6860) `40ants-bots/models/user:user` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](0586) `40ants-bots/models/user:user-platform` (user) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](e26d) `40ants-bots/models/user:user-platform-id` (user) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](e3e7) `40ants-bots/models/user:user-raw` (user) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-USERNAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](4c36) `40ants-bots/models/user:user-username` (user) (:username)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](0586) `40ants-bots/models/user:user-platform` (user) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](e26d) `40ants-bots/models/user:user-platform-id` (user) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](e3e7) `40ants-bots/models/user:user-raw` (user) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-USERNAME-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](4c36) `40ants-bots/models/user:user-username` (user) (:username)


[6a9f]: https://40ants.com/bots/
[cd41]: https://github.com/40ants/bots
[fbfc]: https://github.com/40ants/bots/actions
[fcce]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/bot.lisp#L1
[688c]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/bot.lisp#L7
[1d9d]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L1
[0f3e]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L44
[1fcf]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L53
[f387]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L58
[77bd]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L65
[71ed]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L73
[6be3]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L79
[ea5c]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L89
[83a0]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/chat.lisp#L99
[59f1]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/message.lisp#L1
[ee43]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/message.lisp#L31
[3e73]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/message.lisp#L42
[f902]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/message.lisp#L46
[7c67]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/user.lisp#L1
[6398]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/user.lisp#L28
[1e93]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/user.lisp#L34
[c6ce]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/user.lisp#L40
[bd21]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/controllers/user.lisp#L48
[aee8]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/core.lisp#L1
[7e2b]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/core.lisp#L11
[eb27]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/core.lisp#L12
[a044]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/core.lisp#L17
[520c]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/core.lisp#L23
[f5e3]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/db/utils.lisp#L1
[e956]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/db/utils.lisp#L17
[d4d1]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/db/utils.lisp#L24
[0d78]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/db/utils.lisp#L31
[45fb]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/db/utils.lisp#L39
[70a8]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/chat.lisp#L1
[3a96]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/chat.lisp#L17
[0428]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/chat.lisp#L18
[a477]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/chat.lisp#L23
[ce5b]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/chat.lisp#L25
[c146]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/chat.lisp#L31
[c323]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L1
[2482]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L30
[4a9f]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L37
[48c7]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L42
[50d4]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L44
[abc9]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L47
[f7bd]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/message.lisp#L50
[c65b]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/user.lisp#L1
[6860]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/user.lisp#L17
[0586]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/user.lisp#L18
[e26d]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/user.lisp#L23
[4c36]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/user.lisp#L26
[e3e7]: https://github.com/40ants/bots/blob/d3b692c816355f1133b8c7086e0ce64ab4d3e987/src/models/user.lisp#L29
[4d50]: https://github.com/40ants/bots/issues
[2c00]: https://quickdocs.org/40ants-doc
[8236]: https://quickdocs.org/alexandria
[4426]: https://quickdocs.org/cl-telegram-bot2
[0b29]: https://quickdocs.org/dbd-postgres
[5b70]: https://quickdocs.org/mito
[c41d]: https://quickdocs.org/serapeum
[2efd]: https://quickdocs.org/sxql

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
