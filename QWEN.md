# 40ANTS-BOTS Project Overview

## Project Description
40ants-bots is a Common Lisp framework for building products around chat bots. It includes a bot DSL (Domain Specific Language) and an admin interface for interacting with bot users. The framework provides comprehensive functionality for handling chat bot interactions, including user management, chat management, message processing, and payment integration.

## Project Structure
- `/src/` - Main source code with core functionality, controllers, models, and platform-specific implementations
- `/t/` - Test files
- `/docs/` - Documentation files
- `/admin/` - Administrative interface code
- `40ants-bots.asd` - Main ASDF system definition
- `40ants-bots-tests.asd` - Test system definition
- `40ants-bots-docs.asd` - Documentation system definition
- `40ants-bots-ci.asd` - CI system definition

### Key Source Directories
- `/src/controllers/` - Contains controllers for handling different entities (bot, chat, message, payment, user)
- `/src/models/` - Data models for chat, message, user, payment, and feedback
- `/src/telegram/` - Telegram-specific functionality for feedback and payment
- `/src/db/` - Database utilities
- `/src/admin/` - Administrative interface code

## Core Functionality
- **Bot Management**: Core bot class and DSL
- **User Management**: Creating, retrieving, and managing bot users
- **Chat Management**: Handling different chat types and interactions
- **Message Handling**: Processing incoming and outgoing messages
- **Payment Integration**: Support for payments with platform-specific implementations
- **Feedback Collection**: System for gathering user feedback

## Dependencies
The project depends on several Common Lisp libraries:
- `dbd-postgres` - PostgreSQL database driver
- `mito` - ORM for database operations
- `40ants-doc/mito` - Documentation system with Mito integration
- `cl-telegram-bot2` - Telegram bot API implementation
- `alexandria`, `serapeum` - Utility libraries
- `sxql` - SQL query builder

## Building and Running
The project follows Common Lisp ASDF conventions:
- To load: `(ql:quickload :40ants-bots)`
- To run tests: `(asdf:test-system :40ants-bots-tests)`
- To build documentation: `(asdf:load-system :40ants-bots-docs)`

The project can be installed from Quicklisp, but the README recommends installing from Ultralisp.org for more frequent updates.

## Testing
Tests are implemented using the Rove testing framework and are located in the `/t/` directory. The CI system runs tests using both SBCL and CCL implementations.

## Development Conventions
- Uses `uiop:define-package` for package definitions
- Follows Common Lisp object system (CLOS) conventions for classes and generics
- Uses Mito ORM for database models with serial primary key mixins and timestamp recording
- Implements platform-agnostic interfaces with platform-specific implementations

## CI/CD
The project uses 40ants-ci for continuous integration with three workflows:
- `linter` - Code quality checks
- `docs` - Documentation building
- `ci` - Test execution across multiple Lisp implementations

## Key Features
- Multi-platform bot support (with Telegram implementation available)
- Database persistence for chats, users, messages, and payments
- Administrative interface
- Payment processing capabilities
- Feedback collection system
- Extensible architecture with hooks and generics
- Delayed triggers functionality for scheduled tasks

## Delayed Triggers Implementation
The delayed triggers system provides a way to schedule and process tasks at specific times:

- **Model**: The `delayed-trigger` model contains:
  - `processed-at`: Timestamp when the trigger was processed
  - `results`: JSON field to store results from trigger execution
  - `check-at`: Timestamp when the trigger should be processed

- **Controller**: The `40ants-bots/controllers/delayed-trigger` provides:
  - `with-next-trigger` macro: Executes body with trigger processing and updates appropriate fields
  - `reschedule` function: Allows rescheduling a trigger from within the macro body

- **Usage Pattern**: The `with-next-trigger` macro is designed to safely process triggers in a concurrent environment, updating either the processed-at/results fields or rescheduling the trigger if the `reschedule` function is called from within the macro body.

