# replyr-api
A chat api.

## Data schema
### Message
```javascript
{
  "channel": string,
  "username": string,
  "text": string,
  "timestamp": string
}
```
### Post
```javascript
{
  "channel": string,
  "username": string,
  "title": string,
  "text": string,
  "timestamp": string,
  "users": string[],
  "tags": string[]
}
```
### Channel
```javascript
{
  "name": string,
  "messages": Message[]
}
```
## Endpoint schema

### GET Channel
`GET /chat/channel/{channelName}`
### POST Message
`POST /chat/channel/{channelName}/message`

Post data:
```javascript
{
  "username": string,
  "text": string
}
```
### POST Post
`POST /chat/channel/{channelName}/post`

Post data:
```javascript
{
  "username": string,
  "title": string,
  "text": string,
  "users": string[],
  "tags": string[]
}
```
