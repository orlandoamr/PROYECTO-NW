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

   <section class="products-container">
    <section class="products-category">
    <hr>
    <h3>Productos</h3>
      {{foreach products}}
        <section class="cards" style="display:inline-block;margin-left:2rem">
          <div class="card-desc">{{prddsc}}</div>
          <div class="card-img"><img src="{{prdImgPrm}}"/></div>
          <div class="card-price">Precio: {{prdprc}}</div>
          <div class="card-category">Categoria: {{prdctg}}</div>
          <a href="#">Agregar al carrito</a>
          <br>
          <br>
          <br>
          <br>
          <br>
        </section>
      {{endfor products}}
    </section>
  <section> 
 
