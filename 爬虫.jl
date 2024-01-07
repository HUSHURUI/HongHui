using HTTP
using JSON

function post_data(url::String, headers::Dict{String,String}, data::Dict{String,String})
    response = HTTP.request(
        "POST",
        url,
        headers,
        JSON.json(data)
    )
    response_text = String(response.body)
    return JSON.parse(response_text)
end

function fetch_data(url::String, headers::Dict{String,String})
    response = HTTP.get(url, headers)
    response_text = String(response.body)
    return JSON.parse(response_text)
end

# 设置请求头
headers = Dict(
    "Content-Type" => "application/json",
    "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0",
    "Accept-Encoding" => "gzip, deflate, br",
    "id_token" => "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ4anR1IiwiYXV0aCI6IlJPTEVfQzIiLCJleHAiOjE3MDQ3MTI3MTR9.PpJroSaytUZA0rULogLyVMO7mA48CXQueimkn6z8xx-A-jdZbANxnfllq7js7sQ1nn4vB5GJftg-GiQKH-GzDw",
    "Accept" => "application/json, text/plain, */*"
)

# 设置请求体数据
jwt = Dict(
    "username" => "xjtu",
    "password" => "123456"
)

# 设置要发送 POST 请求的 URL
post_url = "https://www.integreatx.com/api/authenticate"

# 发送请求并解析响应的 JSON 数据
idtoken = post_data(post_url, headers, jwt)

# 输出结果
println(idtoken)
# 设置要爬取的 API URL
api_url = "https://www.integreatx.com/api/building/classify?code=j010100&cityCode=x010100"

# 发送请求并解析响应的 JSON 数据
data = fetch_data(api_url, headers)#貌似不允许爬虫？？？？？？？

# 输出结果
println(data)

response = HTTP.post("https://www.integreatx.com/api/authenticate", "")
