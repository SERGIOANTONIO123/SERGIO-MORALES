<?php
    class tipotratamiento{
        private $_conexion;
        private $_idtipotratamiento;
        private $_desccripciontipotratamiento;
        private $_paginacion=10;
        
        function __construct($conexion,$idtipotratamiento,$descripciontipotratamiento){
            $this->_conexion = $conexion;
            $this->_idtipotratamiento = $idtipotratamiento;
            $this->_descripciontipotratamiento = $descripciontipotratamiento;
            $_SESSION['idusuario']=1;
        }
        function __get($k){
            return $this->$k;
        }
        function __set($k,$v){
            return $this->$k = $v;
        }
        function insertar(){
            $insercion = mysqli_query($this->_conexion,"INSERT INTO tipotratamiento (idtipotratamiento,descripciontipotratamiento) VALUES (NULL,'$this->_descripciontipotratamiento')") or die (mysqli_error($this->_conexion));
            session_start();
            $auditoria = mysqli_query($this->_conexion,"INSERT INTO auditoria(idauditoria, descripcionauditoria, idusuario, fechaauditoria)VALUES (NULL, 'inserto ".static::class." ', ".$_SESSION['id'].",CURDATE())");
            return $insercion;
            
        }
        function modificar (){
            $modificacion = mysqli_query($this->_conexion,"UPDATE tipotratamiento SET descripciontipotratamiento='$this->_descripciontipotratamiento'
            WHERE idtipotratamiento = $this->_idtipotratamiento") or die (mysqli_error($this->_conexion));
             session_start();
            $auditoria = mysqli_query($this->_conexion,"INSERT INTO auditoria(idauditoria, descripcionauditoria, idusuario, fechaauditoria)VALUES (NULL, 'modifico ".static::class." ', ".$_SESSION['id'].",CURDATE())");
            return $modificacion;
        }
        function eliminar(){
            $eliminacion = mysqli_query($this->_conexion, "DELETE FROM tipotratamiento  WHERE idtipotratamiento=$this->_idtipotratamiento");
             session_start();
            $auditoria = mysqli_query($this->_conexion,"INSERT INTO auditoria(idauditoria, descripcionauditoria, idusuario, fechaauditoria)VALUES (NULL, 'elimino ".static::class." ', ".$_SESSION['id'].",CURDATE())");
            return $eliminacion;
        }
        function cantidadpaginas(){
            $cantidadbloques=mysqli_query($this->_conexion,"SELECT CEIL(COUNT(idtipotratamiento)/$this->_paginacion) AS cantidad FROM tipotratamiento") or die(mysqli_error($this->_conexion));
            $unregistro=mysqli_fetch_array($cantidadbloques);
            return $unregistro['cantidad'];
        }
        function listar ($pagina){
            if ($pagina<=0){
                $listado = mysqli_query($this->_conexion,"SELECT * FROM tipotratamiento ORDER BY idtipotratamiento");
            }else{
                $paginacionmax = $pagina * $this->_paginacion;
                $paginacionmin = $paginacionmax - $this->_paginacion;
                $listado = mysqli_query($this->_conexion,"SELECT * FROM tipotratamiento LIMIT  $paginacionmin, $paginacionmax")   or die (mysqli_error($this->_conexion));
            }
            return $listado;    
        }
        function buscar ($busqueda){
            $busqueda = mysqli_query($this->_conexion,"SELECT * FROM tipotratamiento WHERE idtipotratamiento LIKE '%$busqueda%' OR descripciontipotratamiento LIKE '%$busqueda%'")  or die (mysqli_error($this->_conexion));
            return $busqueda    ;    
        }
        function getpermiso ($idusuario){
            $permiso=mysqli_query($this->_conexion,"SELECT ".static::class."rol AS elpermiso FROM rol WHERE idrol IN(SELECT usuario.idrol FROM usuario WHERE usuario.idusuario =  $idusuario)") or die (mysqli_error($this->_conexion));
            $unregistro=mysqli_fetch_array($permiso);
            return $unregistro["elpermiso"];
        }
    }
?>