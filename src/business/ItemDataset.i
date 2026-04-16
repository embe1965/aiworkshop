/*------------------------------------------------------------------------
  File        : ItemDataset.i
  Purpose     : Dataset definition for Item entity
  Syntax      : 
  Description : 
  Author(s)   : 
  Created     : Thu Apr 16 13:36:00 CEST 2026
  Notes       : 
----------------------------------------------------------------------*/

/* Define temp-table for Item */
DEFINE TEMP-TABLE ttItem BEFORE-TABLE bttItem
    FIELD ItemNum AS INTEGER INITIAL "0" LABEL "Item Num"
    FIELD Name AS CHARACTER LABEL "Name"
    FIELD ItemTypeId AS CHARACTER LABEL "Item Type Id"
    FIELD Price AS DECIMAL INITIAL "0" LABEL "Price"
    FIELD Cost AS DECIMAL INITIAL "0" LABEL "Cost"
    FIELD OnHand AS INTEGER INITIAL "0" LABEL "On Hand"
    FIELD OnOrder AS INTEGER INITIAL "0" LABEL "On Order"
    FIELD ReorderLevel AS INTEGER INITIAL "0" LABEL "Reorder Level"
    INDEX ItemNum IS PRIMARY UNIQUE ItemNum ASCENDING.

/* Define dataset for Item */
DEFINE DATASET dsItem FOR ttItem.
