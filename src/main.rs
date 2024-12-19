use actix_web::{get, App, HttpServer, Responder};
use utoipa::OpenApi;
use utoipa_swagger_ui::SwaggerUi;


#[get("/")]
async fn hello() -> impl Responder {
    "Hello, World!"
}



#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)

    })
        .bind(("localhost", 8080))?
        .run()
        .await
}