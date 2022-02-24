Tests and Coverage
================
27 January, 2022 16:19:59

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                                                                       | Coverage (%) |
|:-------------------------------------------------------------------------------------------------------------|:------------:|
| myGolemApp                                                                                                   |     4.44     |
| [R/app\_config.R](../R/app_config.R)                                                                         |     0.00     |
| [R/app\_server.R](../R/app_server.R)                                                                         |     0.00     |
| [R/app\_ui.R](../R/app_ui.R)                                                                                 |     0.00     |
| [R/mod\_character\_explorer\_fct\_data\_manipulation.R](../R/mod_character_explorer_fct_data_manipulation.R) |     0.00     |
| [R/mod\_character\_explorer.R](../R/mod_character_explorer.R)                                                |     0.00     |
| [R/mod\_character\_mentions.R](../R/mod_character_mentions.R)                                                |     0.00     |
| [R/mod\_render\_data\_table.R](../R/mod_render_data_table.R)                                                 |     0.00     |
| [R/run\_app.R](../R/run_app.R)                                                                               |     0.00     |
| [R/utils\_helpers.R](../R/utils_helpers.R)                                                                   |    71.43     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                                 |   n |  time | error | failed | skipped | warning |
|:---------------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-background\_selection.R](testthat/test-background_selection.R) |   4 | 0.054 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                                                       | context               | test                           | status |   n |  time |
|:---------------------------------------------------------------------------|:----------------------|:-------------------------------|:-------|----:|------:|
| [test-background\_selection.R](testthat/test-background_selection.R#L3_L5) | background\_selection | background url selection works | PASS   |   4 | 0.054 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                             |
|:---------|:----------------------------------|
| Version  | R version 4.1.2 (2021-11-01)      |
| Platform | x86\_64-apple-darwin17.0 (64-bit) |
| Running  | macOS Big Sur 10.16               |
| Language | en\_US                            |
| Timezone | Europe/Belgrade                   |

| Package  | Version |
|:---------|:--------|
| testthat | 3.0.4   |
| covr     | 3.5.1   |
| covrpage | 0.1     |

</details>
<!--- Final Status : pass --->
