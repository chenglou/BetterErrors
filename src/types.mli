(* type termKind = Expression | Pattern *)
(* type conflictPair = {inferred: string list; expected: string list} *)
type fileInfo = {
  name: string;
  content: string list;
  line: int;
  cols: int * int;
}

type mismatchTypeArguments = {
  fileInfo: fileInfo;
  typeConstructor: string;
  expectedCount: int;
  actualCount: int;
}
type unboundValue = {
  fileInfo: fileInfo;
  unboundValue: string;
  suggestion: string option;
}
type signatureMismatch = {constructor: string; expectedCount: int; observedCount: int}
type signatureItemMissing = {constructor: string; expectedCount: int; observedCount: int}

type unboundModule = {
  fileInfo: fileInfo;
  unboundModule: string;
  suggestion: string option;
}

type unboundConstructor = {constructor: string; expectedCount: int; observedCount: int}

type unboundTypeConstructor = {
  fileInfo: fileInfo;
  namespacedConstructor: string;
  suggestion: string option;
}
type appliedTooMany = {
  fileInfo: fileInfo;
  functionType: string;
  expectedArgCount: int;
}

type recordFieldNotInExpression = {constructor: string; expectedCount: int; observedCount: int}
type recordFieldError = {constructor: string; expectedCount: int; observedCount: int}
type inconsistentAssumptions = {constructor: string; expectedCount: int; observedCount: int}
type catchAll = {
  fileInfo: fileInfo;
  warningCode: int;
  message: string;
}
type unusedVariable = {constructor: string; expectedCount: int; observedCount: int}

type fieldNotBelong = {
  fileInfo: fileInfo;
  actual: string;
  expected: string;
}
type incompatibleType = {
  fileInfo: fileInfo;
  actual: string;
  expected: string;
}
type notAFunction = {
  fileInfo: fileInfo;
  actual: string;
}
type syntaxError = {
  fileInfo: fileInfo;
}
type illegalCharacter = {
  fileInfo: fileInfo;
  character: string;
}
type patternNotExhaustive = {
  fileInfo: fileInfo;
  unmatched: string list;
  warningCode: int;
}
type unparsableButWithFileInfo = {
  fileInfo: fileInfo;
  error: string;
}
type unboundRecordField = {
  fileInfo: fileInfo;
  recordField: string;
  suggestion: string option;
}
type optionalArgumentNotErased = {
  fileInfo: fileInfo;
  warningCode: int;
  argumentName: string;
}

type message =
  | Type_MismatchTypeArguments of mismatchTypeArguments
  | Type_UnboundValue of unboundValue
  | Type_SignatureMismatch of signatureMismatch
  | Type_SignatureItemMissing of signatureItemMissing
  | Type_UnboundModule of unboundModule
  | Type_UnboundRecordField of unboundRecordField
  | Type_UnboundConstructor of unboundConstructor
  | Type_UnboundTypeConstructor of unboundTypeConstructor
  | Type_AppliedTooMany of appliedTooMany
  | Type_RecordFieldNotInExpression of recordFieldNotInExpression
  | Type_RecordFieldError of recordFieldError
  (* might be the same thing as above? jordan wrote "record expression" instead
  of "pattern" *)
  | Type_RecordFieldNotBelong of recordFieldError
  | Type_FieldNotBelong of fieldNotBelong
  | Type_IncompatibleType of incompatibleType
  | Type_NotAFunction of notAFunction
  | File_SyntaxError of syntaxError
  | Build_InconsistentAssumptions of inconsistentAssumptions
  | Warning_UnusedVariable of unusedVariable
  | Warning_PatternNotExhaustive of patternNotExhaustive
  | Warning_PatternUnused of unusedVariable
  | Warning_OptionalArgumentNotErased of optionalArgumentNotErased
  | File_IllegalCharacter of illegalCharacter
  | Warning_CatchAll of catchAll
  | UnparsableButWithFileInfo of unparsableButWithFileInfo
  | Unparsable of string
  | NoErrorNorWarning of string
  (* | Project_Unknown of string *)
