<?php
     session_start();
     if (isset($_SESSION['id'])){
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>formulario podas</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <?php
           $formulario = "podas";
           include_once("menu.php");
           $pagina = (isset($_GET['pag']))?$_GET['pag']:1;
            $busqueda = (isset($_GET['buscar']))?$_GET['buscar']:"";
        ?>
        <div class="container-fluid">
    <header>
        <br>
        <h1>FORMULARIO PODAS</h1>
        <BR>
            <form>
            <input type="search" name="buscar" value="<?php echo $busqueda; ?>">
            <button class="btn btn-outline-primary" type="submit">Buscar</button>
        </form>
        <br>
        </header>
    <table class="table table-striped table-responsive">
        <tbody>
        <tr>
           
            <th scope="col">FECHA DE LA PODA</th>
            <th scope="col">TIPO DE PODA</th>
            <th scope="col">ID ARBOL</th>
            <th scope="col"></th>
        </tr>
        <?php
            
            include_once("../modelo/conexion.php");
            $objetoconexion = new conexion();
            $conexion = $objetoconexion->conectar();
            
            include_once("../modelo/podas.php");
            $objetopodas = new podas($conexion,0,'idpoda','fechapoda','idtipopoda', 'idarbol');
            $permiso = $objetopodas->getpermiso($_SESSION['id']);
            if (empty($busqueda)){
                 $listapodas = $objetopodas->listar($pagina);
            }else{
                $listapodas = $objetopodas->buscar($busqueda);
            }
           
            
            include_once("../modelo/tipopoda.php");
            $objetotipopoda = new tipopoda($conexion,0,'idtipopoda','descripciontipopoda');
            $listatipopoda = $objetotipopoda->listar(0);
            
            include_once("../modelo/arbol.php");
            $objetoarbol = new arbol($conexion,0,'idarbol','gpsarbol','alturaarbol', 'fechasiembraarbol','idvariedad','idparcela');
            $listaarbol = $objetoarbol->listar(0);
            
            
            if(stripos($permiso,"r")!==false){            //lista
            while($unregistro =mysqli_fetch_array($listapodas)){
                echo'<tr><form class="form-control" id="fmodificarpodas"'.$unregistro["idpoda"].' action="../controlador/controladorpodas.php" method="post">';
                echo '<td><input type="hidden" name="fidpoda" value=" '.$unregistro['idpoda'].'">';
                
                echo '    <input type="date" name="ffechapoda" value="'.$unregistro['fechapoda'].'"></td>';
                
                echo '<td><select name="fidtipopoda" >';
                    while($registroti = mysqli_fetch_array($listatipopoda)){
                   echo '<option value="'.$registroti['idtipopoda'].'"';
                   if($unregistro['idtipopoda'] == $registroti['idtipopoda']){  
                       echo " selected ";
                   }
                   echo '>'.$registroti['descripciontipopoda'].'</option>';
                }
                mysqli_data_seek($listatipopoda,0);
                echo '</select></td>';
                
                echo '<td><select name="fidarbol">';
                    while($registroar = mysqli_fetch_array($listaarbol)){
                   echo '<option value="'.$registroar['idarbol'].'"';
                   if($unregistro['idarbol'] == $registroar['idarbol']){  
                       echo " selected ";
                   }
                   echo '>'.$registroar['idarbol'].'</option>';
                }
                mysqli_data_seek($listaarbol,0);
                echo '</select></td>';
                
                
                
               echo '<td>';
                
                if(stripos($permiso,"u")!==false){  //modificar
               echo' <button type="submit" name="fenviar" value="modificar" class="btn btn-success btn-sm"><i class="fa fa-pencil fa-2x"></i></button>';
                }
                if(stripos($permiso,"d")!==false){            //eliminar
                echo'<button type="submit" name="fenviar" value="eliminar" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
                }
                  echo'       </td>';
                echo '</form></tr>'; 
            }
                }// fin lista
        ?>  
             <?php
                if(stripos($permiso,"c")!==false){            //crear
            ?>
            <tr><form id="fingresarpodas" class="form-control" action="../controlador/controladorpodas.php" method="post">
                
            <td><input type="hidden" name="fidpoda" value="0">
                <input type="date" name="ffechapoda"></td>
            <td><select name="fidtipopoda">
                <?php
                      while($registroti = mysqli_fetch_array($listatipopoda)){
                           echo '<option value="'.$registroti['idtipopoda'].'">'.$registroti['descripciontipopoda'].'</option>';
                      }
                    ?>
                    </select>
                    </td>
                
                
                
            <td><select name="fidarbol">
                <?php
                      while($registroar = mysqli_fetch_array($listaarbol)){
                           echo '<option value="'.$registroar['idarbol'].'">'.$registroar['idarbol'].'</option>';
                      }
                    ?>
                    </select>
                    </td>
                
                
    
           <td> <button type="submit" class="btn btn-primary btn-sm" name="fenviar" value="ingresar"><i class="fa fa-check fa-2x"></i></button>
                  <button type="reset" name="fenviar" value="limpiar" class="btn btn-warning btn-sm"><i class="fa fa-eraser fa-2x"></i></button>
                </td>
                </form> </tr>
            <?php
                } // fin crear
            ?>
        </tbody>
        </table>
       
            <nav>
        <ul class="pagination">
            <?php
            $cantPaginas=$objetopodas->cantidadPaginas();
            if($cantPaginas>1){
                if($pagina>1){
                    echo '<li class="page-item"><a class="page-link" href="formulariopodas.php?pag='.($pagina-1).'" aria-label="Anterior"><span aria-hidden="true">&laquo;</span></a></li>';
                }
                for($i=1;$i<=$cantPaginas;$i++){
                    if($i==$pagina){
                        echo '<li class="page-item active"><a class="page-link" href="#">'.$i.'</a></li>';
                    }else{
                        echo '<li class="page-item" class="page-item"><a class="page-link" href="formulariopodas.php?pag='.$i.'">'.$i.'</a></li>';
                    }
                }
                if ($pagina<$cantPaginas){
                    echo '<li class="page-item"><a class="page-link" href="formulariopodas.php?pag='.($pagina+1).'" aria-label="Siguiente"><span aria-hidden="true">&raquo;</span></a></li>';
                }
            } 
            ?>
            </ul>
        </nav>
            </div>
        <?php
            mysqli_free_result($listapodas);
            mysqli_free_result($listatipopoda);
            mysqli_free_result($listaarbol);
            $objetoconexion->desconectar($conexion);
        ?>
        <script src="js/jquery-3.1.1.slim.min.js"></script>
        <script src="js/tether.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html> 
  <?php
}else{
    header("location:../index.html?mensaje=nosesion");
}
?>