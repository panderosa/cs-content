#   (c) Copyright 2016 Hewlett-Packard Enterprise Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
########################################################################################################################
#!!
#! @description: Returns a list of the best terms and phrases in query result
#!               documents.
#!
#! @input api_key: API key
#! @input text: query text
#! @input field_text: optional - fields that results documents must contain
#! @input indexes: optional - one or more text indexes to return only documents that are
#!                 stored in these text indexes
#! @input max_date: optional - latest creation date or time that a document can have
#!                  to return as a result
#! @input max_results: optional - maximum number of related concepts to return
#!                     default: 20
#! @input min_date: optional - earliest creation date or time that a document can have
#!                  to return as a result
#! @input min_score: optional - minimum percentage relevance that results must have
#!                   to return as a result.
#!                   default: 0
#! @input sample_size: optional - maximum number of documents to use to generate concepts.
#!                     The maximum value is 500 for public datasets, and 10000
#!                     for your own text indexes.
#!                     default: 250
#! @input proxy_host: optional - proxy server
#! @input proxy_port: optional - proxy server port
#!
#! @output return_result: result of API
#! @output error_message: error message if one exists, empty otherwise
#!
#! @result SUCCESS: best phrases and terms retrieved successfully
#! @result FAILURE: there was an error while trying to retrieve best phrases and terms
#!!#
########################################################################################################################

namespace: io.cloudslang.haven_on_demand.search

imports:
  http: io.cloudslang.base.http
  print: io.cloudslang.base.print

flow:
  name: find_related_concepts

  inputs:
    - api_key:
        sensitive: true
    - find_related_concepts_api:
        default: "https://api.havenondemand.com/1/api/sync/findrelatedconcepts/v1"
        private: true
    - text
    - field_text:
        default: ""
        required: false
    - indexes:
        default: ""
        required: false
    - max_date:
        default: ""
        required: false
    - max_results:
        default: "20"
        required: false
    - min_date:
        default: ""
        required: false
    - min_score:
        default: "0"
        required: false
    - sample_size:
        default: "250"
        required: false
    - proxy_host:
        required: false
    - proxy_port:
        required: false

  workflow:
    - connect_to_server:
        do:
          http.http_client_post:
            - url: >
                ${str(find_related_concepts_api) + '?text=' + str(text) + '&indexes=' + str(indexes) + '&max_date=' +
                 str(max_date) + '&max_results=' + max_results + '&min_date=' + str(min_date) + '&sample_size=' +
                 sample_size + '&apikey=' + str(api_key)}
            - proxy_host
            - proxy_port
        publish:
            - error_message
            - return_result

    - on_failure:
        - print_fail:
            do:
              print.print_text:
                - text: ${"Error - " + error_message}

  outputs:
    - error_message
    - return_result
