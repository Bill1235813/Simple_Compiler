# Pika Compiler
A compiler that convert a strange type of language Pika to another 
more strange type of assembly (some .asm).

## Types

type | regular expr
--- | ---
*integerConstant* | **(+\|-)?[0..9]^+**
*floatingConstant* | **(+\|-)?([0..9]*.[0..9]^+)(E(+\|-)?[0..9]^+)?**
*booleanConstant* | **\_true\_ \| \_false\_**
*stringConstant* | **"[^"\n]*"**
*characterConstant* | **^a^, ascii from 32 to 126**
*Rational* | **N/A** (rational number)
*Array* | **N/A** (array of other types)
*Lambda* | **N/A** (function types)

## Keywords

pika-0: ``exec`` | ``const`` | ``var`` | ``print`` | ``_true_`` | ``_false`` | ``_n_`` (only in print)

pika-1: ``bool`` | ``char`` | ``string`` | ``int`` | ``float`` |  ``_t_`` (only in print) | pika-0

pika-2: ``if`` | ``else`` | ``while`` | ``release`` | ``length`` | ``rat`` | ``new`` | ``clone`` | pika-1

pika-3: ``func`` | ``void`` | ``return`` | ``call`` | ``break`` | ``continue`` | pika-2

pika-4: ``static`` | ``for`` | ``elem`` | ``index`` | ``of`` | ``map`` | ``reduce`` | ``fold`` | ``zip`` | ``reverse`` | pika-3

## Operator

**+** | **-** | **\*** | **/** | **<** | **<=** | **==** | **!=** | **>** | **>=** | **&&** | **!** | **||** | **//** | **///** | **////**

## Punctuation

**;** | **,** | **.** | **{** | **}** | **(** | **)** | **\[** | **\]** | **|** | **#** | **:=**

## Grammar
*S* -> *globalDefinition* **exec** *blockStatement*

*globalDefinition* -> *functionDefinition* \
*functionDefinition* -> **func** *identifier* *lambda*

*lambda* -> *lambdaParamType* *blockStatement* \
*lambdaParamType* -> **<** *parameterList* **> ->** *type*
*parameterList* -> *parameterSpecification* CONCATENATES **,** \
*parameterSpecification* -> *type* *identifier*

*type* -> **void** | *primitiveType* | *arrayType* | *lambdaType* \
*primitiveType* -> **bool** | **char*** | **string** | **int** | **float** | **rat** \
*arrayType* -> **\[** *type* **\]**
*lambdaType* -> **<** *typeList* **> ->** *type* \
*typeList* -> *type* CONCATENATES **,**

*blockStatement* -> **{** *statement\** **}**

*statement* -> *declaration* | *assignmentStatement* | *ifStatement* | *whileStatement* | *forStatement* | *releaseStatement* | *returnStatement* | *callStatement* | *breakStatement* | *continueStatement* | *printStatement* | *blockStatement*

*declaration* -> **static**? (**const** | **var**) *identifier* := *expression* **.**

*assignmentStatement* -> *target* := *expression*. \
*target* -> *identifier*

*ifStatement* -> **if** **(** *expression* **)** *blockStatement* (**else** *blockStatement*)? \
*whileStatement* -> **while** **(** *expression* **)** *blockStatement* \
*forStatement* -> **for** (**index** | **elem**) *identifier* **of** *expression blockStatement*

*releaseStatement* -> **release** *expression* **.** \ 
*returnStatement* -> **return** *expression*? **.**

*callStatement* -> **call** *functionInvocation* **.** \
*functionInvocation* -> *expression* **(** *expressionList* **)** \
*expressionList* -> *expression* CONCATENATES **,**

*breakStatement* -> **break .** \
*continueStatement* -> **call .**

*printStatement* -> **print** *printExpressionList*. \
*printExpressionList* -> *printExpression* CONCATENATES (**,** | **;**) \
*printExpression* -> *expression* | **\_n\_** | **\_t\_** | ``epsilon``

*expression* ->  *expression* **map** *expression* | *expression* **reduce** *expression* | *expression* **fold** (**\[** *expression* **\]**)? *expression* | **zip** *expression* **,** *expression* **,** *expression* | **reverse** *expression* | *expression operator expression* | **!** *expression* | **(** *expression* **)** | **\[** *expression* **|** *type* **\]** | *expression* **\[** *expression* **\]** | **length** *expression* | *arrayExpression* | *functionInvocation* | *lambda* | *literal*

*arrayExpression* -> **new** *arrayType* **(** *expression* **)** | **\[** *expressionList* **\]** | **clone** *expression*

*literal* -> *integerConstant* | *floatingConstant* | *characterConstant* | *booleanConstant* | *stringConstant* | *identifier*
