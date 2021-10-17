# README

Endpoint is application which is used for mock server. You can create an endpoint with response status, body and headers. When someone tries to hit that endpoint it will fetch the data from database and give it as response.


Things you may want to cover:

* Versions

- Ruby - 2.7.2

- Rails - 6.1.4.1

- Postgres - 14.0

**Run the below command for test cases**

```
rspec spec

```

**Documentation for APIs**

**Postman collection link** - https://www.getpostman.com/collections/cde87019a6319a03eab7

## Error response format

```
{
    "success": false,
    "message": "Record not found",
    "meta": [],
    "errors": [
        {
            "detail": "Couldn't find Endpoint with 'id'=5"
        }
    ]
}

```

## Create an endpoint

### Request
```shell
curl --location --request POST 'localhost:3000/api/v1/endpoints' \
--header 'Content-Type: application/json' \
--data-raw '{
    "endpoint": {
        "verb": "get",
        "path": "/greetings",
        "response": {
            "code": 200,
            "headers": {"X-ComanyName-Api-Version": "V1", "X-DUMMY-KEY": "dummy_key"},
            "body": {"message": "Hello, world" }
            }
    }
}
'

```

### Response

```
{
    "data": {
        "id": "12",
        "type": "endpoint",
        "attributes": {
            "id": 12,
            "verb": "GET",
            "path": "/greetings",
            "response": {
                "code": 200,
                "headers": {
                    "X-ComanyName-Api-Version": "V1",
                    "X-DUMMY-KEY": "dummy_key"
                },
                "body": {
                    "message": "Hello, world"
                }
            },
            "created_at": "2021-10-17T16:13:01.653Z",
            "updated_at": "2021-10-17T16:13:01.653Z"
        }
    }
}

```

## List endpoints

### Request

```shell
curl --location --request GET 'localhost:3000/api/v1/endpoints'

```

### Response

```
{
    "data": [
        {
            "id": "1",
            "type": "endpoint",
            "attributes": {
                "id": 1,
                "verb": "GET",
                "path": "dummy_path",
                "response": {
                    "code": "300"
                },
                "created_at": "2021-10-17T09:41:57.058Z",
                "updated_at": "2021-10-17T09:41:57.058Z"
            }
        },
        ...
    ]
}

```

## Get details of an endpoint

### Request

```shell
curl --location --request GET 'localhost:3000/api/v1/endpoints/:endpoint_id'

```

### Response

```
{
    "data": {
        "id": "6",
        "type": "endpoint",
        "attributes": {
            "id": 6,
            "verb": "GET",
            "path": "/vishal9",
            "response": {
                "code": 200
            },
            "created_at": "2021-10-17T10:02:01.623Z",
            "updated_at": "2021-10-17T10:02:01.623Z"
        }
    }
}

```

## Update endpoint

### Request

```shell
curl --location --request PUT 'localhost:3000/api/v1/endpoints/6' \
--header 'Content-Type: application/json' \
--data-raw '{
    "endpoint": {
        "verb": "get",
        "path": "/greetings2",
        "response": {
            "code": 200,
            "headers": {"X-ComanyName-Api-Version": "V1", "X-DUMMY-KEY": "dummy_key"},
            "body": {"message": "Hello, world" }
            }
    }
}
'
```

### Response

```
{
    "data": {
        "id": "6",
        "type": "endpoint",
        "attributes": {
            "id": 6,
            "verb": "GET",
            "path": "/greetings2",
            "response": {
                "code": 200,
                "headers": {
                    "X-ComanyName-Api-Version": "V1",
                    "X-DUMMY-KEY": "dummy_key"
                },
                "body": {
                    "message": "Hello, world"
                }
            },
            "created_at": "2021-10-17T10:02:01.623Z",
            "updated_at": "2021-10-17T16:17:46.207Z"
        }
    }
}

```

## Remove an endpoint

### Request

```shell
curl --location --request DELETE 'localhost:3000/api/v1/endpoints/5'

```