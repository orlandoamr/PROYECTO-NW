<nav class="navbar navbar-light bg-light mt-0 p-3 sticky-top">
  <div class="container">
    <h1 class="fs-5 text-center">Items en su carrito: {{total_items}}</h1>
    <button class="btn btn-primary btn-lg" onClick="window.location.href='index.php?page=cart'">
      Ver Carrito
    </button>
  </div>
</nav>
<section>


   
<div class="container mt-3">
<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    {{foreach heroes}}
      <div class="carousel-item {{active}}">
        <img src="{{heroimgurl}}" class="d-block w-100" >
         <div class="carousel-caption d-none d-md-block">
        <h5>{{heroname}}</h5>
      </div>
      </div>
     
    {{endfor heroes}}
  </div>
</div>
</div>



  <section class="container mt-5">
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
                  <span class="fs-5">{{prddsc}}</span>
                  <h5 class="card-title fs-5">${{prdprc}}</h5>

                  <form action="index.php?page=index" method="post">
                    <input type="hidden" name="id" id="id" value="{{prdcod}}">
                    <input type="hidden" name="desc" id="desc" value="{{prddsc}}">
                    <input type="hidden" name="price" id="price" value="{{prdprc}}">
                    <input type="hidden" name="imgurl" id="imgurl" value="{{prdImgPrm}}">
                    <input type="number" name="cant" id="cant" value="1" min="1" class="input form-control mb-3" >

                    <button class="btn btn-primary btn-lg" 
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
