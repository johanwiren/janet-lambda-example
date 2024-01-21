(declare-project
 :name "lambda-example"
 :dependencies [{:repo "https://github.com/johanwiren/janet-lambda-runtime.git"}
                "spork"])

(declare-executable
 :name "runtime"
 :entry "src/lambda-example.janet"
 :install false)
