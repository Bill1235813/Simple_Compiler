# Pika Compiler
A compiler that convert a strange type of language Pika to another 
more strange type of assembly (some .asm).

## Types

type | regular expr
--- | ---
*integerConstant* | **(+\|-)?[0..9]^+**
*floatingConstant* | **(+\|-)?([0..9]*.[0..9]^+)(E(+\|-)?[0..9]^+)?**
*booleanConstant* | **``_true_`` \| ``_false_``**
*stringConstant* | **"[^"\n]*"**
*characterConstant* | **^a^, ascii from 32 to 126**

## Keywords

## Operator

## Punctuation

## Grammar
