########################################################################################################################
#!!
#! @description: Creates a run in workspace.
#!
#! @input auth_token: The authorization token for terraform
#! @input workspace_id: The Id of created workspace
#!                      Optional
#! @input run_message: Specifies the message to be associated with this run
#!                     Optional
#! @input is_destroy: Specifies if this plan is a destroy plan, which will destroy all provisioned resources.
#!                    Optional
#! @input request_body: The request body of the crate run.
#!                      Optional
#! @input proxy_host: Proxy server used to access the Terraform service.
#!                    Optional
#! @input proxy_port: Proxy server port used to access the Terraform service.Default: '8080'
#!                    Optional
#! @input proxy_username: Proxy server user name.
#!                        Optional
#! @input proxy_password: Proxy server password associated with the proxy_username input value.
#!                        Optional
#! @input trust_all_roots: Specifies whether to enable weak security over SSL/TSL. A certificate is trusted even if no
#!                         trusted certification authority issued it.
#!                         Optional
#! @input x_509_hostname_verifier: Specifies the way the server hostname must match a domain name in the subject's
#!                                 Common Name (CN) or subjectAltName field of the X.509 certificate. Set this to
#!                                 allow_all to skip any checking. For the value browser_compatible the hostname
#!                                 verifier works the same way as Curl and Firefox. The hostname must match either the
#!                                 first CN, or any of the subject-alts. A wildcard can occur in the CN, and in any of
#!                                 the subject-alts. The only difference between browser_compatible and strict is that a
#!                                 wildcard (such as *.foo.com) with browser_compatible matches all subdomains,
#!                                 including a.b.foo.com.
#!                                 Optional
#! @input trust_keystore: The pathname of the Java TrustStore file. This contains certificates from other parties that
#!                        you expect to communicate with, or from Certificate Authorities that you trust to identify
#!                        other parties.  If the protocol (specified by the 'url') is not 'https' or if trustAllRoots is
#!                        'true' this input is ignored. Format: Java KeyStore (JKS)
#!                        Optional
#! @input trust_password: The password associated with the TrustStore file. If trustAllRoots is false and trustKeystore
#!                        is empty, trustPassword default will be supplied.
#!                        Optional
#! @input connect_timeout: The time to wait for a connection to be established, in seconds. A timeout value of '0'
#!                         represents an infinite timeout.
#!                         Optional
#! @input socket_timeout: The timeout for waiting for data (a maximum period inactivity between two consecutive data
#!                        packets), in seconds. A socketTimeout value of '0' represents an infinite timeout.
#!                        Optional
#! @input execution_timeout: The amount of time (in milliseconds) to allow the client to complete the execution of an
#!                           API call. A value of '0' disables this feature
#!                           Optional
#! @input async: Whether to run the operation is async mode
#!               Optional
#! @input polling_interval: The time, in seconds, to wait before a new request that verifies if the operation finished
#!                          is executed.
#!                          Optional
#! @input keep_alive: Specifies whether to create a shared connection that will be used in subsequent calls. If
#!                    keepAlive is false, the already open connection will be used and after execution it will close it.
#!                    Optional
#! @input connections_max_per_route: The maximum limit of connections on a per route basis.
#!                                   Optional
#! @input connections_max_total: The maximum limit of connections in total.
#!                               Optional
#! @input response_character_set: The character encoding to be used for the HTTP response,If responseCharacterSet is
#!                                empty, the charset from the 'Content-Type' HTTP response header will be used.If
#!                                responseCharacterSet is empty and the charset from the HTTP response Content-Type
#!                                header is empty, the default value will be used. You should not use this for
#!                                method=HEAD or OPTIONS
#!                                Optional
#!
#! @output return_result: If successful, returns the complete API response containing the messages.
#! @output status_code: The HTTP status code for Terraform API request.
#! @output run_id: Id of the run.
#!
#! @result SUCCESS: The request was successfully executed.
#! @result FAILURE: There was an error while trying to get the messages.
#!!#
########################################################################################################################

namespace: io.cloudslang.hashicorp.terraform.runs

operation: 
  name: create_run
  
  inputs:
    - auth_token:
        sensitive: true
        required: true
    - authToken:
        default: ${get('auth_token', '')}
        required: true
        private: true
        sensitive: true
    - workspace_id:  
        required: false  
    - workspaceId: 
        default: ${get('workspace_id', '')}  
        required: false 
        private: true 
    - run_message:  
        required: false  
    - runMessage: 
        default: ${get('run_message', '')}  
        required: false 
        private: true 
    - is_destroy:  
        required: false  
    - isDestroy: 
        default: ${get('is_destroy', '')}  
        required: false 
        private: true 
    - request_body:  
        required: false  
    - requestBody: 
        default: ${get('request_body', '')}  
        required: false 
        private: true 
    - proxy_host:  
        required: false  
    - proxyHost: 
        default: ${get('proxy_host', '')}  
        required: false 
        private: true 
    - proxy_port:  
        required: false  
    - proxyPort: 
        default: ${get('proxy_port', '')}  
        required: false 
        private: true 
    - proxy_username:  
        required: false  
    - proxyUsername: 
        default: ${get('proxy_username', '')}  
        required: false 
        private: true 
    - proxy_password:  
        required: false  
        sensitive: true
    - proxyPassword: 
        default: ${get('proxy_password', '')}  
        required: false 
        private: true 
        sensitive: true
    - trust_all_roots:  
        required: false  
    - trustAllRoots: 
        default: ${get('trust_all_roots', '')}  
        required: false 
        private: true 
    - x_509_hostname_verifier:  
        required: false  
    - x509HostnameVerifier: 
        default: ${get('x_509_hostname_verifier', '')}  
        required: false 
        private: true 
    - trust_keystore:  
        required: false  
    - trustKeystore: 
        default: ${get('trust_keystore', '')}  
        required: false 
        private: true 
    - trust_password:  
        required: false  
        sensitive: true
    - trustPassword: 
        default: ${get('trust_password', '')}  
        required: false 
        private: true 
        sensitive: true
    - connect_timeout:  
        required: false  
    - connectTimeout: 
        default: ${get('connect_timeout', '')}  
        required: false 
        private: true 
    - socket_timeout:  
        required: false  
    - socketTimeout: 
        default: ${get('socket_timeout', '')}  
        required: false 
        private: true 
    - execution_timeout:  
        required: false  
    - executionTimeout: 
        default: ${get('execution_timeout', '')}  
        required: false 
        private: true 
    - async:  
        required: false  
    - polling_interval:  
        required: false  
    - pollingInterval: 
        default: ${get('polling_interval', '')}  
        required: false 
        private: true 
    - keep_alive:  
        required: false  
    - keepAlive: 
        default: ${get('keep_alive', '')}  
        required: false 
        private: true 
    - connections_max_per_route:  
        required: false  
    - connectionsMaxPerRoute: 
        default: ${get('connections_max_per_route', '')}  
        required: false 
        private: true 
    - connections_max_total:  
        required: false  
    - connectionsMaxTotal: 
        default: ${get('connections_max_total', '')}  
        required: false 
        private: true 
    - response_character_set:  
        required: false  
    - responseCharacterSet: 
        default: ${get('response_character_set', '')}  
        required: false 
        private: true 
    
  java_action: 
    gav: 'io.cloudslang.content:cs-hashicorp-terraform:1.0.0-RC3'
    class_name: 'io.cloudslang.content.hashicorp.terraform.actions.runs.CreateRun'
    method_name: 'execute'
  
  outputs: 
    - return_result: ${get('returnResult', '')} 
    - status_code: ${get('statusCode', '')} 
    - run_id: ${get('runId', '')} 
  
  results: 
    - SUCCESS: ${returnCode=='0'} 
    - FAILURE