# Curl

`curl` is a command line tool which is used to transfer data over the internet. It began as a project by Daniel Stenberg to transfer data over HTTP but has now evolved into a very robust tool that transfers data not just over HTTP but also FTP, TELNET, IMAP, and many more.

#### `GET`

This command will fetch the HTML for the HTTPBin homepage. Notice that we've not mentioned the protocol or the HTTP method. They've defaulted to HTTP and GET, respectively.

```bash
$ curl www.httpbin.org
```

#### `HEAD Request`

Sometimes you may want to see just the headers that the server would return when it's issued a GET request. In such a case, we'd use the HEAD method. The head request is issued with -I (capital i) or --head.

```bash
$ curl -I www.httpbin.org
HTTP/1.1 200 OK
Server: nginx
Date: Thu, 01 Dec 2016 18:50:56 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 12150
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
Connection: keep-alive
```

#### `VERBOSE Output`

Sometimes, you may want to debug a problem because the curl command hasn't returned what it was supposed to or just hasn't worked at all. In such cases, you can use the verbose mode using -v or --verbose to get more output from curl.

```bash
$ curl -Iv www.httpbin.org
* Rebuilt URL to: www.httpbin.org/
*   Trying 23.22.14.18...
* Connected to www.httpbin.org (23.22.14.18) port 80 (#0)
```

- Lines prefixed with an asterisk (*) show additional work curl has done.
- The first line shows that curl added a slash at the end of the URL
- The second line shows that curl has resolved the URL to an IP address.
- Finally, the third line shows that curl has connected to the URL on port 80.

Lines prefixed with a greater-than (>) sign show the data curl has sent to the server.

```bash
> HEAD / HTTP/1.1
> Host: www.httpbin.org
> User-Agent: curl/7.47.0
> Accept: */*
```

Lines prefixed with a less-than (<) sign show the data curl has received from the server.

```bash
< HTTP/1.1 200 OK
HTTP/1.1 200 OK
< Server: nginx
Server: nginx
```

#### `Multiple Requests`

```bash
$ curl httpbin.org/status/418 httpbin.org/status/418
```

#### `POST Requests`

Send URL encoded data as a part of the POST body

```bash
$ curl -d 'name=rob+mar&foo=bar' httpbin.org/post
```

Send JSON data as a part of the POST body


```bash
$ curl -d '{"name":"Rob Mar","foo":"bar"}' httpbin.org/post
```

#### `Setting Headers`

```bash
$ curl -H 'Content-Type: application/json' -d '{"name":"Rob Mar","foo":"bar"}' httpbin.org/post
```

#### `Posting Form Data`

```bash
$ curl -F "name=Rob Mar" -F "foo=bar"  httpbin.org/post
```

#### `Uploading Files`

Using curl, you can upload files both as a part of a form field or to a ReST API endpoint. We'll first create a file and then upload it both as a part of a form and to a ReST endpoint.

```bash
$ echo "hello, world" >> file.txt
$ curl -F "file=@file.txt" httpbin.org/post
```

Since we're using the -F flag, the file is uploaded as a part of the form. You specify the file to upload by an @ followed by the path to the file. Since our file is in the current directory, we just specify the file name.

Uploading to a ReST endpoint is similar. We just use the -d flag instead.

```bash
$ curl -d @file.txt httpbin.org/post
```

#### `PUT Requests`

```bash
$ curl -X PUT -d '{"name":"Rob Mar"}' httpbin.org/put
```

#### `DELETE Requests`

```bash
$ curl -X DELETE httpbin.org/delete
```

#### `Basic Authentication`


```bash
$ curl -u robmar:pwd123 httpbin.org/basic-auth/robmar/pwd123
$ curl robmar:pwd123@httpbin.org/basic-auth/robmar/pwd123
```

#### `Setting Cookies`

```bash
$ curl --cookie "name=robmar;foo=bar" httpbin.org/cookies
```

## HTTP Headers

```bash
$ curl -Iv httpbin.org/get     
*   Trying 23.22.14.18...
* Connected to httpbin.org (23.22.14.18) port 80 (#0)
> HEAD /get HTTP/1.1
> Host: httpbin.org> User-Agent: curl/7.49.1
> Accept: */*
> 
< HTTP/1.1 200 OKHTTP/1.1 200 OK
< Server: nginxServer: nginx
< Date: Wed, 14 Dec 2016 16:23:11 GMTDate: Wed, 14 Dec 2016 16:23:11 GMT
< Content-Type: application/json
Content-Type: application/json
< Content-Length: 186
Content-Length: 186
< Connection: keep-alive
Connection: keep-alive
< Access-Control-Allow-Origin: *
Access-Control-Allow-Origin: *
< Access-Control-Allow-Credentials: true
Access-Control-Allow-Credentials: true

```

#### `Authorization Header`

The Authorization header is used to provide authentication information such as bearer tokens.The server then uses this information to find out if the request should be processed further or not, depending on the validity of the authentication information provided. 

```
Authorization: Bearer 3beca038a248ff027d0445342fe285
```

#### `Cache-Control Header`

The Cache-Control header decides how long applications, such as the browser, can keep a local copy of the data. This helps improve the efficiency since it helps avoid a round-trip to the server. Cache-Control has various directives that control various aspects of caching, such as the length of time data may be cached or if it shouldn't be cached at all.

```
Cache-Control: max-age=100
```

#### `Expires Header`

The Expires header is also used for caching and specifies the date and time after which a particular cached resource is considered stale. When both Expires and Cache-Control header are set, the Cache-Control header takes higher priority.

```
Expires: Wed, 21 Oct 2015 07:28:00 GMT
```

#### `Connection Header`

The Connection header specifies whether a connection should last for the duration of the request or if it should stay open, allowing it to be reused for subsequent requests. The default value is "close" which creates a connection that only lasts for the duration of the request. Setting the header to "keep-alive" allows it to be persistent. 

```
Connection: keep-alive
```

#### `Accept Header`

The Accept header tells the server what kind of content the client is expecting. The value of this header is the MIME type of the content. 

```
Accept: application/json
```

#### `Cookie Header`

The cookie header contains all the cookies and their values. Cookies are used to identify the users, maintain sessions, and so on. 

```
Cookie: name=Robmar;foo=bar
```

#### `Content-Length Header`

The Content-Length header specifies the length of the content in bytes. 

```
Content-Length: 111020
```

#### `Content-Type Header`

The Content-Type header tells the client the MIME-type of the content that it has received. 

```
Content-Type: application/json
```
