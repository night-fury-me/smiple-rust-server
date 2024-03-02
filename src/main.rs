use actix_web::{web, App, HttpServer, Responder};
use serde::Deserialize;
use std::env;

#[derive(Deserialize)]
struct GreetQuery {
    name: String,
}

async fn greet(query: web::Query<GreetQuery>) -> impl Responder {
    format!("Hello, {}, from Rust Server!", query.name)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let port = env::var("PORT").unwrap_or_else(|_| "8080".to_string());
    let server_address = format!("0.0.0.0:{}", port); // localhost

    HttpServer::new(|| App::new().route("/greet", web::get().to(greet)))
        .bind(&server_address)?
        .run()
        .await
}
