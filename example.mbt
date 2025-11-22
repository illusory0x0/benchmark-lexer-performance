///|
let keywords : ReadOnlyArray[StringView] = [
  "as", "else", "extern", "fn", "fnalias", "if", "let", "const", "match", "using",
  "mut", "type", "typealias", "struct", "enum", "trait", "traitalias", "derive",
  "while", "break", "continue", "import", "return", "throw", "raise", "try", "catch",
  "pub", "priv", "readonly", "true", "false", "_", "test", "loop", "for", "in", "impl",
  "with", "guard", "async", "is", "suberror", "and", "letrec", "enumview", "noraise",
  "defer",
]

///|
let keyword_set : Set[StringView] = Set::from_array(keywords)

///|
priv enum Token {
  Keyword(StringView)
  Identifier(StringView)
  Number(StringView)
} derive(Show, ToJson)

///|
fn tokenize_two_pass(input : StringView) -> Array[Token] {
  let mut remaining = input
  let tokens = []
  while !remaining.is_empty() {
    lexmatch remaining with longest {
      ("[a-zA-Z_][a-zA-Z_0-9]*" as tok, r) => {
        let token = if keyword_set.contains(tok) {
          Keyword(tok)
        } else {
          Identifier(tok)
        }
        tokens.push(token)
        remaining = r
      }
      ("\d+" as tok, r) => {
        tokens.push(Number(tok))
        remaining = r
      }
      ("\s+", r) => remaining = r
      _ => remaining = try! remaining[1:]
    }
  }
  tokens
}

///|
fn tokenize_one_pass(input : StringView) -> Array[Token] {
  let mut remaining = input
  let tokens = []
  while !remaining.is_empty() {
    lexmatch remaining with longest {
      ("as" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("else" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("extern" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("fn" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("fnalias" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("if" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("let" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("const" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("match" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("using" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("mut" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("type" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("typealias" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("struct" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("enum" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("trait" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("traitalias" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("derive" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("while" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("break" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("continue" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("import" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("return" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("throw" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("raise" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("try" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("catch" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("pub" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("priv" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("readonly" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("true" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("false" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("\\_" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("test" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("loop" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("for" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("in" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("impl" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("with" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("guard" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("async" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("is" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("suberror" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("and" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("letrec" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("enumview" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("noraise" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("defer" as tok, r) => {
        tokens.push(Keyword(tok))
        remaining = r
      }
      ("[a-zA-Z_][a-zA-Z_0-9]*" as tok, r) => {
        tokens.push(Identifier(tok))
        remaining = r
      }
      ("\d+" as tok, r) => {
        tokens.push(Number(tok))
        remaining = r
      }
      ("\s+", r) => remaining = r
      _ => remaining = try! remaining[1:]
    }
  }
  tokens
}

///|
test {
  let input = "let priv pub 1323"
  @json.inspect(tokenize_two_pass(input), content=[
    ["Keyword", "let"],
    ["Keyword", "priv"],
    ["Keyword", "pub"],
    ["Number", "1323"],
  ])
  @json.inspect(tokenize_one_pass(input), content=[
    ["Keyword", "let"],
    ["Keyword", "priv"],
    ["Keyword", "pub"],
    ["Number", "1323"],
  ])
}

///|
test (b : @bench.T) {
  let input = "let priv pub 123 ".repeat(1000)
  b.bench(name="one pass", fn() { b.keep(tokenize_one_pass(input)) })
  b.bench(name="two pass", fn() { b.keep(tokenize_two_pass(input)) })
}
