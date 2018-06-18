package main

import (
	"flag"
	"html/template"
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

var addr = flag.String("addr", "localhost:3000", "http service address")

var upgrader = websocket.Upgrader{} // use default options

func producto(w http.ResponseWriter, r *http.Request) {
	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Print("upgrade:", err)
		return
	}
	defer c.Close()
	for {
		mt, message, err := c.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}
		log.Printf("recv: %s", message)
        
		err = c.WriteMessage(mt, message)
		if err != nil {
			sock = emit('carrito',JSON.res(res));
            res.send("ok");
			break
		}
	}
}

func cars(w http.ResponseWriter, r *http.Request) {
    c, err := upgrader.Upgrade(w, r, nil)
    if err != nil {
        log.Print("upgrade:", err)
        return
    }
    defer c.Close()
    for {
        mt, message, err := c.ReadMessage()
        if err != nil {
            log.Println("read:", err)
            break
        }
        log.Printf("recv: %s", JSON.res(res))
        
        err = c.WriteMessage(mt, message)
        if err != nil {
            sock = emit('carrito',JSON.res(res));
            break
        }
    }
}

func home(w http.ResponseWriter, r *http.Request) {
	homeTemplate.Execute(w, "ws://"+r.Host+"/echo")
}

func main() {
	flag.Parse()
    db, err := sql.Open("mysql", "user:password@/database")
    if err != nil {
        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
    }
    defer db.Close()

	log.SetFlags(0)
	http.HandleFunc("/prodcuto", producto)
    http.HandleFunc("/cars", cars)
	http.HandleFunc("/", home)
	log.Fatal(http.ListenAndServe(*addr, nil))
}

var homeTemplate = template.Must(template.New("").Parse(`
extends layout

block content
    h1 Carrito de Compras
    p Lista de Productos

    .car
        h1 Carrito
        button#listo Listo
        br

    script(src="/javascripts/jquery.min.js") 
    script(src="/socket.io/socket.io.js")
    script(src="/javascripts/app.js")


`))


var cars = template.Must(template.New("").Parse(`
extends layout

block content
    h1 Carritos de Compras
    .body

    script(src="/javascripts/jquery.min.js") 
    script(src="/socket.io/socket.io.js")
    script(src="/javascripts/app2.js")


`))


var nuevo = template.Must(template.New("").Parse(`
extends layout

block content
    h1 Guarda un nuevo producto
    form(id="sa" action="", method="POST" )
        input(type="text" name="n" placeholder = "Nombre")
        br      
        input(type="text" name="p" placeholder="Precio")            
        br      
        input(type="text" name="s" placeholder="Stock")
        br      
        input(type="file" name="" id="files")
        output#list
        input(type="hidden" name="f" id="res")
        br      
        input.save(type="submit" value="Guardar")
    script(src="/javascripts/jquery.min.js") 
    script(src="/javascripts/p.js") script(src="/javascripts/app2.js")


`))

func guardar(prod) {
     stmtIns, err := db.Prepare("INSERT INTO producto VALUES (null , ? , ? ,? ,?)",prod) // ? = placeholder
    if err != nil {
        panic(err.Error()) // proper error handling instead of panic in your app
    }
    defer stmtIns.Close()
}

func gellAll(){
    stmtOut, err := db.Prepare("SELECT * FROM producto")
    if err != nil {
        panic(err.Error()) // proper error handling instead of panic in your app
    }
    defer stmtOut.Close()

    // Insert square numbers for 0-24 in the database
    for i := 0; i < 25; i++ {
        _, err = stmtIns.Exec(i, (i * i)) // Insert tuples (i, i^2)
        if err != nil {
            panic(err.Error()) // proper error handling instead of panic in your app
        }
    }
    return stmtOut;
}


    