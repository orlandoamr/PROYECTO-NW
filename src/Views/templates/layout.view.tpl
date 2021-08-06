<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/appstyle.css" />
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/style.css" />
  <script src="https://kit.fontawesome.com/bd626a0718.js" crossorigin="anonymous"></script>
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>
<body>
  <header>
    <div>
      <img src="http://localhost/proyecto-nw/public/imgs/logo.jpg" />
      <h1>{{SITE_TITLE}}</h1>
    </div>
    <nav>
      <ul>
        <li><a href="index.php?page=index">Inicio</a></li>
        <li><a href="index.php?page=sec_login">Iniciar Sesión</a></li>
        <li><a href="index.php?page=sec_register">Crear Cuenta</a></li>
      </ul>
    </nav>
  </header>
  <main>
  {{{page_content}}}
  </main>
  <footer>
    <div>Todo los Derechos Reservados 2021 &copy;</div>
  </footer>
  {{foreach EndScripts}}
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
</body>
</html>
