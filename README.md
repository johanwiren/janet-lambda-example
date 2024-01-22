# Janet lambda example

Example project to demo https://github.com/johanwiren/janet-lambda-runtime

## Requirements

* Docker (to build using AWS provided.al2023)
* AWS SAM cli (optional, scroll down)

## Usage (with SAM cli)

Note that this example uses `arm64`. If you are on `x86_64` you will need to update *template.yaml*

### Build the project

```
sam build
```

### Deploy the project

```
sam deploy

...
...
...

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Outputs                                                                                                                                                                       
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Key                 HelloWorldFunctionIamRole                                                                                                                                 
Description         Implicit IAM Role created for Hello World function                                                                                                        
Value               arn:aws:iam::427536279568:role/janet-lambda-example-HelloWorldFunctionRole-utxeeqp8sMA3                                                                   

Key                 HelloWorldApi                                                                                                                                             
Description         API Gateway endpoint URL for Prod stage for Hello World function                                                                                          
Value               https://z8xv7bc8e9.execute-api.eu-north-1.amazonaws.com/hello                                                                                            

Key                 HelloWorldFunction                                                                                                                                        
Description         Hello World Lambda Function ARN                                                                                                                           
Value               arn:aws:lambda:eu-north-1:427536279568:function:janet-lambda-example-HelloWorldFunction-KsmjbbtvOZQC                                                      
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Successfully created/updated stack - janet-lambda-example in eu-north-1
```

### Invoke the API url

Find the URL (*HelloWorldApi*) in the above outputs from sam deploy

```
curl https://z8xv7bc8e9.execute-api.eu-north-1.amazonaws.com/hello
```

Wohoo, we now have a serverless api backed by a Janet lambda function!

## Usage (just build the lambda please)

Ok, but I don't want all the bells and whistles using SAM.

Fine, then just run

```
make
```

This will produce a `build/bootstrap` that can be used with the `provided.al2023` runtime on lambda.
