within Annex60.Airflow.Multizone;
model Staircase
  "Zone representing a staircase connecting multiple floor models"

  parameter Modelica.SIunits.Temperature TRoom = 293.15
    "Indoor air temperature of room in K";
  parameter Modelica.SIunits.Height heightRoom = 3 "Height of room in m";
  parameter Modelica.SIunits.Length lengthRoom = 3 "Length of room in m";
  parameter Modelica.SIunits.Length widthRoom = 3 "Width of room in m";
  parameter Real doorOpening = 1
    "Opening of door (between 0:closed and 1:open)";

  replaceable package Medium = Modelica.Media.Air.SimpleAir;
  parameter Boolean forceErrorControlOnFlow = true
    "Flag to force error control on m_flow. Set to true if interested in flow rate";

  Fluid.MixingVolumes.MixingVolume volumeStairs(
    redeclare package Medium = Medium,
    m_flow_nominal=0.001,
    V=heightRoom*lengthRoom*widthRoom,
    T_start=TRoom,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    nPorts=6) "Air volume of staircase element"
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAir(T=TRoom)
    "Fixed air temperature for room"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor conRoom(G=1E9)
    "Thermal conductor between fixed T and Volume"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a3(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b3(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{50,90},{70,110}})));
  MediumColumn col2(
    redeclare package Medium = Medium,
    h=heightRoom/2,
    densitySelection=Annex60.Airflow.Multizone.Types.densitySelection.fromTop)
                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-60})));

  MediumColumn col(
    redeclare package Medium = Medium,
    h=heightRoom/2,
    densitySelection=Annex60.Airflow.Multizone.Types.densitySelection.fromTop)
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  MediumColumn col1(
    redeclare package Medium = Medium,
    h=heightRoom/2,
    densitySelection=Annex60.Airflow.Multizone.Types.densitySelection.fromBottom)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  MediumColumn col3(
    redeclare package Medium = Medium,
    h=heightRoom/2,
    densitySelection=Annex60.Airflow.Multizone.Types.densitySelection.fromBottom)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Orifice ori(
    redeclare package Medium = Medium,
    forceErrorControlOnFlow=forceErrorControlOnFlow,
    A=widthRoom*lengthRoom/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,80})));
  Orifice ori1(
    redeclare package Medium = Medium,
    forceErrorControlOnFlow=forceErrorControlOnFlow,
    A=widthRoom*lengthRoom/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,80})));
  DoorDiscretizedOperable doo(
      redeclare package Medium = Medium,
      LClo=20*1E-4,
      wOpe=1,
      hOpe=2.2,
      CDOpe=0.78,
      CDClo=0.78,
      nCom=10,
      hA=3/2,
      hB=3/2,
      dp_turbulent(displayUnit="Pa") = 0.01,
      forceErrorControlOnFlow=forceErrorControlOnFlow)
                              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,0})));
  Modelica.Blocks.Sources.Constant const(k=doorOpening)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-60,30})));
equation
  connect(TAir.port, conRoom.port_a) annotation (Line(
      points={{-20,0},{-10,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(conRoom.port_b, volumeStairs.heatPort) annotation (Line(
      points={{10,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a2, port_a2) annotation (Line(
      points={{-60,-100},{-60,-100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_a2, col2.port_b) annotation (Line(
      points={{-60,-100},{-60,-80},{-30,-80},{-30,-70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_b2, col.port_b) annotation (Line(
      points={{60,-100},{60,-80},{10,-80},{10,-70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_b1, port_b) annotation (Line(
      points={{-90,-6},{-92,-6},{-92,-60},{-100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_a2, port_a) annotation (Line(
      points={{-90,6},{-92,6},{-92,60},{-100,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const.y, doo.y) annotation (Line(
      points={{-60,23.4},{-60,0},{-69,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ori.port_b, port_a3) annotation (Line(
      points={{-60,90},{-60,100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ori.port_a, col1.port_a) annotation (Line(
      points={{-60,70},{-60,64},{-30,64},{-30,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(col3.port_a, ori1.port_a) annotation (Line(
      points={{10,60},{10,62},{60,62},{60,70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ori1.port_b, port_b3) annotation (Line(
      points={{60,90},{60,100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_b2, volumeStairs.ports[1]) annotation (Line(
      points={{-70,6},{-56,6},{-56,-24},{24,-24},{26.6667,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_a1, volumeStairs.ports[2]) annotation (Line(
      points={{-70,-6},{-62,-6},{-62,-26},{26,-26},{28,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(col2.port_a, volumeStairs.ports[3]) annotation (Line(
      points={{-30,-50},{-30,-28},{28,-28},{29.3333,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(col.port_a, volumeStairs.ports[4]) annotation (Line(
      points={{10,-50},{10,-30},{30,-30},{30.6667,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(col3.port_b, volumeStairs.ports[5]) annotation (Line(
      points={{10,40},{10,34},{64,34},{64,-30},{36,-30},{32,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(col1.port_b, volumeStairs.ports[6]) annotation (Line(
      points={{-30,40},{-30,32},{62,32},{62,-26},{38,-26},{33.3333,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics),                         Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})));
end Staircase;