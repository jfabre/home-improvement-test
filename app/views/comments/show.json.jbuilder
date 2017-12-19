json.id @comment.id
json.body @comment.body
json.created_at @comment.created_at

json.user do
  json.id @comment.user.id
  json.full_name @comment.user.full_name
  json.image @comment.user.image
end  