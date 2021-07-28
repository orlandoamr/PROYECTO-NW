<nav class="navbar navbar-light bg-light m-0 p-3 sticky-top">
  <div class="container  ">
    <h1 class="fs-5 text-center">Items en su carrito: {{total_items}}</h1>
    <button class="btn btn-primary btn-lg" onClick="window.location.href='index.php?page=cart'">
      Ver Carrito
    </button>
  </div>
</nav>
<section>
  {* {{foreach heroes}}
    <section class="hero">
      <img src="/{{~BASE_DIR}}/{{heroimgurl}}">
      <section class="action">
          {{heroname}}
          <br/>
          {{heroaction}}
      </section>
      <hr/>
    </section>
  {{endfor heroes}} *}

  <section>
    <br>
    <br>
    <br>
    <br>
    <br>
      Aqui van todos los items del hero
    <br>
    <br>
    <br>
    <br>
    <br>
  </section>
    <hr>
    <hr>

  <section class="container">
    <h3>Productos</h3>
      <div class="row">
      {{foreach products}}
        <div class="col-3 p-1">          
            <div class="card">
              <img 
                title="{{prddsc}}"
                alt="{{prddsc}}"
                class="card-img-top" 
                src="{{prdImgPrm}}"
                data-toggle="popover"
                data-trigger="hover"
                data-bs-content="{{prddsc}}" />
              
              <div class="card-body">
                  <span>{{prddsc}}</span>
                  <h5 class="card-title">L.{{prdprc}}</h5>

                  <form action="index.php" method="post">
                    <input type="hidden" name="id" id="id" value="{{prdcod}}">
                    <input type="hidden" name="desc" id="desc" value="{{prddsc}}">
                    <input type="hidden" name="price" id="price" value="{{prdprc}}">
                    <input type="hidden" name="imgurl" id="imgurl" value="{{prdImgPrm}}">

                    <button class="btn btn-primary" 
                      name="btnAccion" 
                      value="add" 
                      type="submit">
                      Agregar al carrito
                    </button>
                  </form>
              </div>
            </div>
        </div>
        {{endfor products}}
     </div>
  </section>
    
