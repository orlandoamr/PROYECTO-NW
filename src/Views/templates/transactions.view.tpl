<section class="container">

    <h2>Su historial de transacciones</h2>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr class="bg-secondary fs-5 text-light p-2">
                <th width="15%" class="text-center">Fecha</th>
                <th width="40%" class="text-center">Detalle de la compra</th>
                <th width="40%" class="text-center">Total de la compra</th>
            </tr>
        </thead>
        <tbody>
            {{foreach transactions}}
                <tr class="bg-light text-dark">
                    <th width="15%" class="text-center"> 
                        {{date}}
                    </th>
                    <th width="20%" class="text-center">
                        
                        <table class="w-100">
                            <thead>
                                <tr class="bg-secondary fs-5 text-light p-2">
                                    <th>Producto</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            {{foreach products}}
                                <tr>
                                    <th>{{desc}}</th>
                                    <th>${{price}}</th>
                                    <th>{{cant}}</th>
                                    <th>${{total}}</th>
                                </tr>
                                {{endfor products}}
                            </tbody>
                        </table>
                    </th>
                    <th width="20%" class="text-center">${{total}}</th>
                </tr>
            {{endfor transactions}}
        </tbody>
    </table>
</section>
