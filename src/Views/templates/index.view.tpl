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
  <section>
    elementos almacenados en la sesión: <br>
   
    {{foreach cart_items}}
      <br>
      <span>{{desc}}</span>
      <br>
      <span>L.{{price}}</span>
      <br>
    {{endfor cart_items}}
  </section>
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

                  <form action="index.php?page=index&action=add&id={{prdcod}}" method="post">
                    <input type="hidden" name="id" id="id" value="{{prdcod}}">
                    <input type="hidden" name="desc" id="desc" value="{{prddsc}}">
                    <input type="hidden" name="price" id="price" value="{{prdprc}}">
                    <input type="hidden" name="imgurl" id="imgurl" value="{{prdImgPrm}}">

                    <button class="btn btn-primary" 
                      name="btnAccion" 
                      value="Agregar" 
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
    
