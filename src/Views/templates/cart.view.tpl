<section class="container">
    <h2>Su carrito de compra</h2>
    <table class="table table-light table-bordered bg-primary">
        <thead class="thead-dark">
            <tr>
                <th width="40%">Descripción</th>
                <th width="15%" class="text-center">Cantidad</th>
                <th width="20%" class="text-center">Precio</th>
                <th width="20%" class="text-center">Total</th>
                <th width="5%">--</th>
            </tr>
        </thead>
        <tbody>
            {{foreach cart_items}}
                <tr>
                    <th width="40%">{{desc}}</th>
                    <th width="15%" class="text-center">1</th>
                    <th width="20%" class="text-center">{{price}}</th>
                    <th width="20%" class="text-center">{{price}}</th>
                    <th width="5%">--</th>
                </tr>
            {{endfor cart_items}}
        </tbody>
    </table>
</section>
