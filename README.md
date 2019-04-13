# replyr-api

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
### Channel
```javascript
{
  "name": string,
  "messages": Message[]
}
```
