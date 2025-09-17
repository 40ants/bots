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

#### [package](5913) `40ants-bots`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-24HELLO-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### HELLO

<a id="x-2840ANTS-BOTS-3AHELLO-20CLASS-29"></a>

###### [class](dccd) `40ants-bots:hello` ()

Example class.

**Readers**

<a id="x-2840ANTS-BOTS-3AUSER-NAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-3AHELLO-29-29"></a>

###### [reader](3087) `40ants-bots:user-name` (hello) (:name)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-3FGenerics-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Generics

<a id="x-2840ANTS-BOTS-3ASAY-20GENERIC-FUNCTION-29"></a>

##### [generic-function](411f) `40ants-bots:say` obj

Say what should be said.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-3AMAKE-HELLO-20FUNCTION-29"></a>

##### [function](9e82) `40ants-bots:make-hello` name

Makes hello world example

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FAPI-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/API

<a id="x-28-23A-28-2815-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FAPI-22-29-20PACKAGE-29"></a>

#### [package](ce9c) `40ants-bots/api`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FAPI-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FAPI-3ASEND-MESSAGE-20FUNCTION-29"></a>

##### [function](45d8) `40ants-bots/api:send-message` chat-or-user text &rest rest &key business-connection-id message-thread-id parse-mode entities link-preview-options disable-notification protect-content allow-paid-broadcast message-effect-id reply-parameters reply-markup

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FBOT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/BOT

<a id="x-28-23A-28-2815-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FBOT-22-29-20PACKAGE-29"></a>

#### [package](86d8) `40ants-bots/bot`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FBOT-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FBOT-24BOT-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### BOT

<a id="x-2840ANTS-BOTS-2FBOT-3ABOT-20CLASS-29"></a>

###### [class](6298) `40ants-bots/bot:bot` ()

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FBOT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/BOT

<a id="x-28-23A-28-2827-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FBOT-22-29-20PACKAGE-29"></a>

#### [package](3e6b) `40ants-bots/controllers/bot`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FBOT-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FBOT-3AGET-CURRENT-BOT-20FUNCTION-29"></a>

##### [function](27e0) `40ants-bots/controllers/bot:get-current-bot`

Возвращает инстанс текущего бота из переменной *current-bot*.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FCHAT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/CHAT

<a id="x-28-23A-28-2828-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FCHAT-22-29-20PACKAGE-29"></a>

#### [package](5f8b) `40ants-bots/controllers/chat`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FCHAT-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3ACREATE-CHAT-20FUNCTION-29"></a>

##### [function](8c47) `40ants-bots/controllers/chat:create-chat` platform platform-id &key (type :chat) raw

Создает новый чат в базе данных.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CHAT-BY-ID-20FUNCTION-29"></a>

##### [function](6a6a) `40ants-bots/controllers/chat:get-chat-by-id` id

Возвращает чат по его `ID`.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CHAT-BY-PLATFORM-ID-20FUNCTION-29"></a>

##### [function](62da) `40ants-bots/controllers/chat:get-chat-by-platform-id` platform platform-id &optional (type :chat)

Находит чат по platform, platform-id и type.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CHAT-TITLE-20FUNCTION-29"></a>

##### [function](958c) `40ants-bots/controllers/chat:get-chat-title` chat

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-CURRENT-CHAT-20FUNCTION-29"></a>

##### [function](da5e) `40ants-bots/controllers/chat:get-current-chat`

Возвращает текущий активный чат из переменной *current-chat*.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-OR-CREATE-CHAT-20FUNCTION-29"></a>

##### [function](4e5f) `40ants-bots/controllers/chat:get-or-create-chat` platform platform-id &key (type :chat) raw

Находит или создает чат по platform, platform-id и type.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3AGET-PRIVATE-CHAT-20FUNCTION-29"></a>

##### [function](1040) `40ants-bots/controllers/chat:get-private-chat` user

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FCHAT-3ALIST-CHATS-20FUNCTION-29"></a>

##### [function](c262) `40ants-bots/controllers/chat:list-chats` &key (limit 100) (offset 0)

Возвращает список чатов с пагинацией.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/MESSAGE

<a id="x-28-23A-28-2831-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-22-29-20PACKAGE-29"></a>

#### [package](559d) `40ants-bots/controllers/message`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3ACREATE-MESSAGE-20FUNCTION-29"></a>

##### [function](31db) `40ants-bots/controllers/message:create-message` platform platform-id chat user text &key raw (incomingp nil)

Создает новое сообщение в базе данных.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3AGET-MESSAGE-20FUNCTION-29"></a>

##### [function](99e9) `40ants-bots/controllers/message:get-message` id

Возвращает сообщение по его `ID`.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FMESSAGE-3ALIST-MESSAGES-20FUNCTION-29"></a>

##### [function](eec2) `40ants-bots/controllers/message:list-messages` &key (limit 100) (offset 0)

Возвращает список сообщений с пагинацией.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FPAYMENT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/PAYMENT

<a id="x-28-23A-28-2831-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FPAYMENT-22-29-20PACKAGE-29"></a>

#### [package](2802) `40ants-bots/controllers/payment`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FPAYMENT-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FPAYMENT-3ACREATE-PAYMENT-20FUNCTION-29"></a>

##### [function](2567) `40ants-bots/controllers/payment:create-payment` platform chat user currency &key amount raw extra-info

Creates new payment.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FPAYMENT-3AGET-PAYMENT-BY-ID-20FUNCTION-29"></a>

##### [function](3332) `40ants-bots/controllers/payment:get-payment-by-id` id

Returns payment by `ID`.

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FPAYMENT-3AMOVE-PAYMENT-TO-PAID-20FUNCTION-29"></a>

##### [function](8d65) `40ants-bots/controllers/payment:move-payment-to-paid` payment &key amount raw

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FCONTROLLERS-2FUSER-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/CONTROLLERS/USER

<a id="x-28-23A-28-2828-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FCONTROLLERS-2FUSER-22-29-20PACKAGE-29"></a>

#### [package](db7a) `40ants-bots/controllers/user`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FCONTROLLERS-2FUSER-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3ACREATE-USER-20FUNCTION-29"></a>

##### [function](9312) `40ants-bots/controllers/user:create-user` platform platform-id username raw

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3AGET-CURRENT-USER-20FUNCTION-29"></a>

##### [function](2eb0) `40ants-bots/controllers/user:get-current-user`

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3AGET-OR-CREATE-USER-20FUNCTION-29"></a>

##### [function](f7a1) `40ants-bots/controllers/user:get-or-create-user` platform platform-id username raw

<a id="x-2840ANTS-BOTS-2FCONTROLLERS-2FUSER-3AGET-USER-20FUNCTION-29"></a>

##### [function](952a) `40ants-bots/controllers/user:get-user` platform platform-id

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FDB-2FUTILS-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/DB/UTILS

<a id="x-28-23A-28-2820-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FDB-2FUTILS-22-29-20PACKAGE-29"></a>

#### [package](4958) `40ants-bots/db/utils`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FDB-2FUTILS-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AHASH-FROM-DB-20FUNCTION-29"></a>

##### [function](b409) `40ants-bots/db/utils:hash-from-db` value

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AHASH-TO-DB-20FUNCTION-29"></a>

##### [function](05fc) `40ants-bots/db/utils:hash-to-db` value

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AKEYWORD-FROM-DB-20FUNCTION-29"></a>

##### [function](4828) `40ants-bots/db/utils:keyword-from-db` value

<a id="x-2840ANTS-BOTS-2FDB-2FUTILS-3AKEYWORD-TO-DB-20FUNCTION-29"></a>

##### [function](02d3) `40ants-bots/db/utils:keyword-to-db` value

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FGENERICS-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/GENERICS

<a id="x-28-23A-28-2820-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FGENERICS-22-29-20PACKAGE-29"></a>

#### [package](d1ea) `40ants-bots/generics`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FGENERICS-3FGenerics-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Generics

<a id="x-2840ANTS-BOTS-2FGENERICS-3AON-SUCCESS-PAYMENT-20GENERIC-FUNCTION-29"></a>

##### [generic-function](bf1f) `40ants-bots/generics:on-success-payment` bot payment

Called when platform sends an approve of successful payment.

First argument will be a platform dependent bot instance,
the second instance will be a mito dao object of `40ANTS-BOTS/MODELS/PAYMENT:PAYMENT` type.

The end user must define a method to process successul payments.

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FCHAT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/CHAT

<a id="x-28-23A-28-2823-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FCHAT-22-29-20PACKAGE-29"></a>

#### [package](b88c) `40ants-bots/models/chat`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FCHAT-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FCHAT-24CHAT-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### CHAT

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-20CLASS-29"></a>

###### [class](5797) `40ants-bots/models/chat:chat` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](deae) `40ants-bots/models/chat:chat-platform` (chat) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](2366) `40ants-bots/models/chat:chat-platform-id` (chat) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](ce93) `40ants-bots/models/chat:chat-raw` (chat) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [reader](7cb8) `40ants-bots/models/chat:chat-type` (chat) (:type = :chat)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](deae) `40ants-bots/models/chat:chat-platform` (chat) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](2366) `40ants-bots/models/chat:chat-platform-id` (chat) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](ce93) `40ants-bots/models/chat:chat-raw` (chat) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FCHAT-3ACHAT-29-29"></a>

###### [accessor](7cb8) `40ants-bots/models/chat:chat-type` (chat) (:type = :chat)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FFEEDBACK-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/FEEDBACK

<a id="x-28-23A-28-2827-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FFEEDBACK-22-29-20PACKAGE-29"></a>

#### [package](bffc) `40ants-bots/models/feedback`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FFEEDBACK-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FFEEDBACK-24FEEDBACK-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### FEEDBACK

<a id="x-2840ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-20CLASS-29"></a>

###### [class](3329) `40ants-bots/models/feedback:feedback` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-MESSAGE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-29-29"></a>

###### [reader] `40ants-bots/models/feedback:feedback-message` (feedback) (:message)

<a id="x-2840ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-MESSAGE-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-29-29"></a>

###### [reader] `40ants-bots/models/feedback:feedback-message-id` (feedback) (:message-id)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-MESSAGE-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-29-29"></a>

###### [accessor] `40ants-bots/models/feedback:feedback-message` (feedback) (:message)

<a id="x-2840ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-MESSAGE-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FFEEDBACK-3AFEEDBACK-29-29"></a>

###### [accessor] `40ants-bots/models/feedback:feedback-message-id` (feedback) (:message-id)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FMESSAGE-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/MESSAGE

<a id="x-28-23A-28-2826-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FMESSAGE-22-29-20PACKAGE-29"></a>

#### [package](88a6) `40ants-bots/models/message`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FMESSAGE-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FMESSAGE-24MESSAGE-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### MESSAGE

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-20CLASS-29"></a>

###### [class](c394) `40ants-bots/models/message:message` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](c394) `40ants-bots/models/message:message-chat` (message) (:chat)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](c394) `40ants-bots/models/message:message-chat-id` (message) (:chat-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-INCOMING-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](90b4) `40ants-bots/models/message:message-incoming` (message) (:incoming :incomingp)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](a09a) `40ants-bots/models/message:message-platform` (message) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](c1d2) `40ants-bots/models/message:message-platform-id` (message) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](9b23) `40ants-bots/models/message:message-raw` (message) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-TEXT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](dce0) `40ants-bots/models/message:message-text` (message) (:text)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](c394) `40ants-bots/models/message:message-user` (message) (:user)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [reader](c394) `40ants-bots/models/message:message-user-id` (message) (:user-id)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](c394) `40ants-bots/models/message:message-chat` (message) (:chat)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-CHAT-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](c394) `40ants-bots/models/message:message-chat-id` (message) (:chat-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-INCOMING-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](90b4) `40ants-bots/models/message:message-incoming` (message) (:incoming :incomingp)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](a09a) `40ants-bots/models/message:message-platform` (message) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](c1d2) `40ants-bots/models/message:message-platform-id` (message) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](9b23) `40ants-bots/models/message:message-raw` (message) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-TEXT-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](dce0) `40ants-bots/models/message:message-text` (message) (:text)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](c394) `40ants-bots/models/message:message-user` (message) (:user)

<a id="x-2840ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-USER-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FMESSAGE-3AMESSAGE-29-29"></a>

###### [accessor](c394) `40ants-bots/models/message:message-user-id` (message) (:user-id)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FPAYMENT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/PAYMENT

<a id="x-28-23A-28-2826-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FPAYMENT-22-29-20PACKAGE-29"></a>

#### [package](63c5) `40ants-bots/models/payment`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FPAYMENT-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FPAYMENT-24PAYMENT-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### PAYMENT

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-20CLASS-29"></a>

###### [class](8c2b) `40ants-bots/models/payment:payment` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-AMOUNT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader](d1d2) `40ants-bots/models/payment:payment-amount` (payment) (:amount)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-CHAT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader] `40ants-bots/models/payment:payment-chat` (payment) (:chat)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-CHAT-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader] `40ants-bots/models/payment:payment-chat-id` (payment) (:chat-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-CURRENCY-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader](5bce) `40ants-bots/models/payment:payment-currency` (payment) (:currency)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-EXTRA-INFO-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader](4887) `40ants-bots/models/payment:payment-extra-info` (payment) (:extra-info)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader](0279) `40ants-bots/models/payment:payment-platform` (payment) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader](9ba1) `40ants-bots/models/payment:payment-raw` (payment) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-STATE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader](be0c) `40ants-bots/models/payment:payment-state` (payment) (:state)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-USER-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader] `40ants-bots/models/payment:payment-user` (payment) (:user)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-USER-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [reader] `40ants-bots/models/payment:payment-user-id` (payment) (:user-id)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-AMOUNT-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor](d1d2) `40ants-bots/models/payment:payment-amount` (payment) (:amount)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-CHAT-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor] `40ants-bots/models/payment:payment-chat` (payment) (:chat)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-CHAT-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor] `40ants-bots/models/payment:payment-chat-id` (payment) (:chat-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-CURRENCY-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor](5bce) `40ants-bots/models/payment:payment-currency` (payment) (:currency)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-EXTRA-INFO-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor](4887) `40ants-bots/models/payment:payment-extra-info` (payment) (:extra-info)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor](0279) `40ants-bots/models/payment:payment-platform` (payment) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor](9ba1) `40ants-bots/models/payment:payment-raw` (payment) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-STATE-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor](be0c) `40ants-bots/models/payment:payment-state` (payment) (:state)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-USER-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor] `40ants-bots/models/payment:payment-user` (payment) (:user)

<a id="x-2840ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-USER-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FPAYMENT-3APAYMENT-29-29"></a>

###### [accessor] `40ants-bots/models/payment:payment-user-id` (payment) (:user-id)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FUSER-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/MODELS/USER

<a id="x-28-23A-28-2823-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FMODELS-2FUSER-22-29-20PACKAGE-29"></a>

#### [package](d092) `40ants-bots/models/user`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FMODELS-2FUSER-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FMODELS-2FUSER-24USER-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### USER

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-20CLASS-29"></a>

###### [class](ccf9) `40ants-bots/models/user:user` (serial-pk-mixin dao-class record-timestamps-mixin)

**Readers**

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](5dc2) `40ants-bots/models/user:user-platform` (user) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](d7ea) `40ants-bots/models/user:user-platform-id` (user) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](d5c0) `40ants-bots/models/user:user-raw` (user) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-USERNAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [reader](6ef1) `40ants-bots/models/user:user-username` (user) (:username)

**Accessors**

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](5dc2) `40ants-bots/models/user:user-platform` (user) (:platform)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-PLATFORM-ID-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](d7ea) `40ants-bots/models/user:user-platform-id` (user) (:platform-id)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-RAW-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](d5c0) `40ants-bots/models/user:user-raw` (user) (:raw)

<a id="x-2840ANTS-BOTS-2FMODELS-2FUSER-3AUSER-USERNAME-20-2840ANTS-DOC-2FLOCATIVES-3AACCESSOR-2040ANTS-BOTS-2FMODELS-2FUSER-3AUSER-29-29"></a>

###### [accessor](6ef1) `40ants-bots/models/user:user-username` (user) (:username)

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FTELEGRAM-2FFEEDBACK-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/TELEGRAM/FEEDBACK

<a id="x-28-23A-28-2829-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FTELEGRAM-2FFEEDBACK-22-29-20PACKAGE-29"></a>

#### [package](2677) `40ants-bots/telegram/feedback`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FTELEGRAM-2FFEEDBACK-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FTELEGRAM-2FFEEDBACK-3AREQUEST-FEEDBACK-20FUNCTION-29"></a>

##### [function] `40ants-bots/telegram/feedback:request-feedback` prompt thank-you-message &key back-to-id

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-4040ANTS-BOTS-2FTELEGRAM-2FPAYMENT-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### 40ANTS-BOTS/TELEGRAM/PAYMENT

<a id="x-28-23A-28-2828-29-20BASE-CHAR-20-2E-20-2240ANTS-BOTS-2FTELEGRAM-2FPAYMENT-22-29-20PACKAGE-29"></a>

#### [package](fa6e) `40ants-bots/telegram/payment`

<a id="x-2840ANTS-BOTS-DOCS-2FINDEX-3A-3A-7C-4040ANTS-BOTS-2FTELEGRAM-2FPAYMENT-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-2840ANTS-BOTS-2FTELEGRAM-2FPAYMENT-3ASEND-INVOICE-20FUNCTION-29"></a>

##### [function](718a) `40ants-bots/telegram/payment:send-invoice` title description provider-token currency prices &key commands extra-info


[6a9f]: https://40ants.com/bots/
[cd41]: https://github.com/40ants/bots
[fbfc]: https://github.com/40ants/bots/actions
[ce9c]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/api.lisp#L1
[45d8]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/api.lisp#L32
[86d8]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/bot.lisp#L1
[6298]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/bot.lisp#L7
[3e6b]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/bot.lisp#L1
[27e0]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/bot.lisp#L9
[5f8b]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L1
[8c47]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L44
[6a6a]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L53
[62da]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L58
[c262]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L65
[4e5f]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L73
[da5e]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L79
[1040]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L89
[958c]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/chat.lisp#L99
[559d]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/message.lisp#L1
[31db]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/message.lisp#L31
[99e9]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/message.lisp#L42
[eec2]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/message.lisp#L46
[2802]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/payment.lisp#L1
[2567]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/payment.lisp#L37
[3332]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/payment.lisp#L49
[8d65]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/payment.lisp#L59
[db7a]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/user.lisp#L1
[2eb0]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/user.lisp#L28
[952a]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/user.lisp#L34
[9312]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/user.lisp#L40
[f7a1]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/controllers/user.lisp#L48
[5913]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/core.lisp#L1
[dccd]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/core.lisp#L11
[3087]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/core.lisp#L12
[9e82]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/core.lisp#L17
[411f]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/core.lisp#L23
[4958]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/db/utils.lisp#L1
[02d3]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/db/utils.lisp#L17
[4828]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/db/utils.lisp#L24
[05fc]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/db/utils.lisp#L31
[b409]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/db/utils.lisp#L39
[d1ea]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/generics.lisp#L1
[bf1f]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/generics.lisp#L7
[b88c]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/chat.lisp#L1
[5797]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/chat.lisp#L17
[deae]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/chat.lisp#L18
[2366]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/chat.lisp#L23
[7cb8]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/chat.lisp#L25
[ce93]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/chat.lisp#L31
[bffc]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/feedback.lisp#L1
[3329]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/feedback.lisp#L17
[88a6]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L1
[c394]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L30
[a09a]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L37
[c1d2]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L42
[dce0]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L44
[90b4]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L47
[9b23]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/message.lisp#L50
[63c5]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L1
[8c2b]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L27
[be0c]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L34
[5bce]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L39
[d1d2]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L44
[0279]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L47
[4887]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L52
[9ba1]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/payment.lisp#L57
[d092]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/user.lisp#L1
[ccf9]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/user.lisp#L17
[5dc2]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/user.lisp#L18
[d7ea]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/user.lisp#L23
[6ef1]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/user.lisp#L26
[d5c0]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/models/user.lisp#L29
[2677]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/telegram/feedback.lisp#L1
[fa6e]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/telegram/payment.lisp#L1
[718a]: https://github.com/40ants/bots/blob/e97cd3510552b46034ed8797b7743605b05242c6/src/telegram/payment.lisp#L76
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
