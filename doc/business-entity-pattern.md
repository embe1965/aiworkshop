# ABL Business Entity Architecture Pattern

## Overview

The Business Entity pattern provides a standardized, maintainable approach to data access in OpenEdge ABL applications. It separates UI logic from database operations through a layered architecture.

## Architecture Layers

### 1. UI Layer (Windows/Forms)
- User interaction and presentation
- Never directly accesses database tables
- Calls Business Entity methods with datasets

### 2. Business Entity Layer
- Data access, business rules, validation
- Inherits from `OpenEdge.BusinessLogic.BusinessEntity`
- Instantiated through EntityFactory (singleton pattern)

### 3. Database Layer
- Persistent storage
- Only through data-sources attached to business entities

## Key Components

### EntityFactory (Singleton Pattern)

Centralized management of business entity lifecycle with lazy initialization.

### Dataset Definition (.i Include Files)

Defines temp-tables and datasets for data transfer with BEFORE-TABLE for change tracking.

### Business Entity Class

Encapsulates all data operations for a specific entity. Must inherit from BusinessEntity and assign data-source handles to ProDataSource.

## Standard CRUD Operations

### Read Operations
- Use OUTPUT DATASET (NOT BY-REFERENCE)
- Build filter as string with WHERE clause
- Call parent's ReadData() method

### Create/Update/Delete Operations
- Use INPUT-OUTPUT DATASET BY-REFERENCE
- Enable TRACKING-CHANGES on temp-table for updates
- Validate before Create/Update operations

## Common Pitfalls

1. Using BY-REFERENCE on OUTPUT DATASET for Read Operations - causes handle mismatch
2. Forgetting Change Tracking for Updates - changes not detected
3. Missing Data-Source to ProDataSource Assignment
4. Direct Database Access from UI
5. Not Using Named Buffers

## Benefits

- Maintainability: Centralized data access logic
- Reusability: Business entities shared across components
- Testability: Business logic isolated from UI
- Consistency: Standard patterns throughout application
- Scalability: Easy to add new entities