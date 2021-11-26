[![Pub](https://img.shields.io/pub/v/analysis_options_cli_generator.svg)](https://pub.dev/packages/analysis_options_cli_generator)

### What will this tool do for me?

**1- Generate analysis_options.yaml file for you which includes the best 100 analysis rules over there, with
ignoring linting analysis for freezed, get_it and json_serializable generated files.**

**2- Add the latest version of flutter_lints package** 

**3- Run pub get command**
### Installing
```shell
dart pub global activate analysis_options_cli_generator
```
### The only command over there ..
```shell
  aog
```
to run any dart script you need to add _/.pub-cache/bin_ to your path, you may need also _$FLUTTER_HOME/bin/cache/dart-sdk/bin_ _FLUTTER_HOME/.pub-cache/bin_

![alt text](https://github.com/MoGaaber/analysis_options_cli_generator/blob/master/assets/sample.gif?raw=true)

##### This command will give you two options :-
##### - _Basic_: default rules
##### - _Custom_: make you choose whether you want to enable these 4 rules or not
###### avoid_print
###### sort_pub_dependencies
###### sort_constructors_first
###### prefer_expression_function_bodies

## Buy me a coffee


<a href="https://www.buymeacoffee.com/mogaber" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>
