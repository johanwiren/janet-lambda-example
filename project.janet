(declare-project
 :name "lambda-example"
 :dependencies [{:repo "https://github.com/johanwiren/janet-lambda-runtime.git"
                 :sha "3b5277972dafcbde06230f0eac613614df4e97c9"}])

(declare-executable
 :name "bootstrap"
 :entry "src/lambda-example.janet"
 :install false)
