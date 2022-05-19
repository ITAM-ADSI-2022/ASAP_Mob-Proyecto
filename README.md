# CafeITAM: A$AP MOB 
Proyecto final sobre la cafeteria del ITAM



  - [Primera Entrega: Personas, Escenarios y Customer Journey](#primera-entrega-personas-escenarios-y-customer-journey)
    - [Personas](#personas)
    - [Escenarios](#escenarios)
    - [Customer Journey](#customer-journey)
  - [Segunda Entrega: Prototipo de Media Fidelidad](#segunda-entrega-prototipo-de-media-fidelidad)
    - [Funcionalidades](#funcionalidades)
    - [Pruebas](#pruebas)
  - [Tercera Entrega: Stories](#tercera-entrega-stories)
  - [Cuarta Entrega: Prototipo de Alta Fidelidad](#cuarta-entrega-prototipo-de-alta-fidelidad)
    - [Demos](#demos)

---
## Primera Entrega: Personas, Escenarios y Customer Journey
### Personas

  Recordando lo aprendido en clase, una persona es "un perfil, un **arquetipo**,  que  incluye  una  definición  de características  generales,  así  como elementos  contextuales  que  permitan entender  las  perspectivas,  creencias, aptitudes, actitudes, del usuario al que ésta representa. Es un personaje ficticio, pero 
realista que representa al usuario." 

Con lo anterior en mente y con la visión de lo que deseabamos que fuera nuestra aplicación y la interacción que ofrecería al usuario. Decidimos crear las siguientes Personas:

- Alicia, estudiante. https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/blob/main/Personas/Alicia.png
- Mauricio, personal administrativo. https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/blob/main/Personas/Mauricio.png
- Sandra Figueroa, profesora. https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/blob/main/Personas/Sandra%20Figueroa.png
- Teodoro, estudiante. https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/blob/main/Personas/Teodoro.jpeg

Por ejemplo, la Persona construida de un usuario típico, en este caso el de Alicia, luce así:

![image](https://user-images.githubusercontent.com/101894380/169352455-07af61ba-9558-4278-9704-425dfc65cdf9.png)

La ventaja de concentrar la información de las Personas de esta manera es, además de la organización que ofrece, que podemos definirlas por diferentes rubros. Por ejemplo, por lo que buscan, hobbies, habilidades, metas, edad, etc. 

### Escenarios

Una Persona siempre se desenvuelve en un escenario. Esta herramienta de UX consiste en "escenas realistas que representan la interacción entre una herramienta y el 
usuario. Permiten que los desarrolladores y los clientes se imaginen su interacción con el sistema en su vida diaria."

Cada escenario se construye a partir de 5 partes principales:

- *Contexto*
- *Triger*
- *Acción*
- *Inputs*
- *Espectativas*

Una vez que teniamos claras nuestras Personas, es decir, los usuarios típicos de nuestra aplicación, modelamos un escenario típico en el que se desenvolvería cada una de ellas, resultando escenarios como el siguiente: 

Escenario de Teodoro.
Son las 7 de la mañana, Teodoro llega apurado al ITAM y entra a su clase de Teoría de Control.
El día anterior estuvo trabajando hasta altas horas de la noche en la oficina, por lo que
despertó tan tarde que apenas tuvo tiempo de alistar su mochila antes de salir de casa. Debido
a la falta de tiempo olvidó su lonche y se muere de hambre.
Una vez avanzada la clase, en medio de un momento de silencio, las tripas de Teodoro “rugen”
por el hambre que tiene, lo que lo apena mucho. Sabe que si no hace nada al respecto este
vergonzoso evento se repetirá, además de que ni siquiera puede prestar atención.
Instantáneamente recuerda que el ITAM lanzó una nueva aplicación de la cafetería en la que
puede pedir su desayuno y después pasar a recogerlo. De esta manera, Teodoro descarga la
aplicación móvil en Apple Store, espera a que se instale y, cuando este proceso termina, abre
con apuro la aplicación e ingresa su correo y contraseña institucional. Se despliega el menú de
cafetería ITAM y, por la rapidez con la que pueden ser preparados, elige unos chilaquiles
verdes y señala que hará el pago en efectivo.
Teoría de Control es la materia más difícil de su plan de estudios, por lo que no puede
permitirse ausentarse por mucho tiempo. Con esto en mente, programa su pedido para ser
recogido en 5 minutos y espera poder terminar sus chilaquiles en aproximadamente 10
minutos.
Cumplidos los 5 minutos, se dirige con prisa a la cafetería, paga y recibe sus chilaquiles verdes.
Ahora Teodoro se encuentra feliz porque su desayuno estuvo delicioso, logró comerlo en el
tiempo estimado y ahora puede regresar con el estómago satisfecho a su clase para prestar
atención y no preocuparse más de aquel vergonzoso evento.

Si desea consultar el resto de escenarios, puede encontrarlos [aquí](https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/blob/main/Escenarios/escenarios.pdf)

### Customer Journey

---

## Segunda Entrega: Prototipo de Media Fidelidad


Decidimos hacer nuestro prototipo de media fidelidad en Moqups usando *Interactions*. 

[Link al prototipo](https://app.moqups.com/a4XSqy9iyFDoWHIkiGq2jcIYFxC8B5Jk/view/page/a5b4ae4f3)

Incluimos capturas de pantalla en [screenshots/](https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/tree/main/Prototipo/screenshots/)
### Funcionalidades

Las funcionalidades/stories que decidimos incluir en este prototipo son:

1. Como usuario puedo crear una cuenta.
2. Como usuario puedo ingresar a mi cuenta.
3. Como usuario puedo pedir el menú del día.
4. Como usuario puedo cancelar mi pedido. 

### Pruebas

Para las pruebas, decidimos aprovechar que Moqups te permite utilizar *Interactions* para simular el flujo de nuestra app. Utilizamos algo parecido a *guerrilla testing* con los miembros de nuestra familia, ya que les pedíamos completar ciertos objetivos sin darles mayor información. Por ejemplo, les pedimos acceder a la aplicación suponiendo que no tienen cuenta, o añadir un platillo a su carrito y después cancelar su pedido. 

Los testers pudieron completar los objetivos que les asignamos en un tiempo razonable (menor a 2 minutos) y sin mucha complicación.

---

## Tercera Entrega: Stories

---


## Cuarta Entrega: Prototipo de Alta Fidelidad 

Para la implementación del prototipo de alta fidelidad optamos por usar Flutter, un framework para aplicaciones móviles y web de Google. Consideramos que su enfoque en la iteración veloz del diseño (con su hot reload) y su soporte de plataformas IOS, Android y web, lo hizo ideal para una implementación rápida pero de alta fidelidad. 

El código de la implementación se encuentra en [Prototipo De Alta Fidelidad/cafeitam/](https://github.com/ITAM-ADSI-2022/ASAP_Mob-Proyecto/tree/main/Prototipo%20De%20Alta%20Fidelidad/cafeitam)

### Demos

A continuación mostramos demos de las funcionalidades en las stories de la tercera entrega. 

- *Como usuario, me registro con mi correo del ITAM.*


  ![gif registro](Prototipo%20De%20Alta%20Fidelidad/gifs/registro.gif)


- *Como usuario, ingreso a la aplicación con mi cuenta.*

  ![gif login](Prototipo%20De%20Alta%20Fidelidad/gifs/login.gif)


- *Como usuario, ordeno el menú del día.*


  ![gif menu dia](Prototipo%20De%20Alta%20Fidelidad/gifs/pedirMenuDelDia.gif)


- *Como usuario, agrego productos al carrito* y *Como usuario, selecciono el horario de entrega.*


  ![gif carrito y checkout](Prototipo%20De%20Alta%20Fidelidad/gifs/pedidoGeneral.gif)


- *Como staff de cafetería, veo las órdenes realizadas en orden* y *Como staff de cafetería, registro la entrega de una orden.*


  ![gif registro](Prototipo%20De%20Alta%20Fidelidad/gifs/cafeDespachaOrdenes.gif)



- *Como staff de cafetería, actualizo el menú del día.*


  ![gif registro](Prototipo%20De%20Alta%20Fidelidad/gifs/editarMenuDelDia.gif)

