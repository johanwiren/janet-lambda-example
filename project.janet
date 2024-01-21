(declare-project
 :name "lambda-example"
 :dependencies
 ["spork"
  {:repo "https://github.com/cosmictoast/jurl.git" :tag "v1.4.2"}
  {:repo "https://github.com/johanwiren/janet-lambda-runtime.git"}])

(declare-source
 :source ["src/janet-lambda-example.janet"])

(declare-executable
 :name "runtime"
 :entry "src/lambda-example.janet"
 :install false)
