json.id user.id
json.username user.username

if user.auth_token 
    json.auth_token user.auth_token
end

if user.documents.any?
    json.documents user.documents do |document|
        json.id document.id
        json.title document.title
        json.file document.file
    end
end