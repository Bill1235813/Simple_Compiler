# Pika Compiler
A compiler that convert a strange type of language Pika to another 
more strange type of assembly (some .asm).

## Types

type | regular expr
--- | ---
*integerConstant* | **(+\|-)?[0..9]^+**
*floatingConstant* | **(+\|-)?([0..9]*.[0..9]^+)(E(+\|-)?[0..9]^+)?**
*booleanConstant* | **_true_ \| _false_**
*stringConstant* | **"[^"\n]*"**
*characterConstant* | **^a^, ascii from 32 to 126**

## Keywords

pika-0: ``exec`` | ``const`` | ``var`` | ``print`` | ``_true_`` | ``_false`` | ``_n_`` (only in print)

pika-1: ``bool`` | ``char`` | ``string`` | ``int`` | ``float`` |  ``_t_`` (only in print) | pika-0

## Operator

**+** | **-** | **\*** | **/** | **<** | **<=** | **==** | **!=** | **>** | **>=**

## Punctuation

**;** | **,** | **.** | **{** | **}** | **(** | **)** | **\[** | **\]** | **|** | **#** | **:=**

## Grammar
*S* -> **exec** *blockStatement*

*blockStatement* -> {*statement\**}

*statement* -> *declaration* | *assignmentStatement* | *printStatement* | *blockStatement*

*declaration* -> **const** *identifier* := *expression*. | **var** *identifier* := *expression*.

*assignmentStatement* -> *target* := *expression*.

*target* -> *identifier*

*printStatement* -> **print** *printExpressionList*.

*printExpressionList* -> *printExpression* concatenates (**,** | **;**)

*printExpression* -> *expression* | **_n_** | **_t_** | ``epsilon``

*expression* -> *expression operator expression* | **(** *expression* **)** | **\[** *expression* **|** *type* **\]** | *literal*

*type* -> **bool** | **char*** | **string** | **int** | **float**

*literal* -> *integerConstant* | *floatingConstant* | *characterConstant* | *booleanConstant* | *stringConstant* | *identifier*
