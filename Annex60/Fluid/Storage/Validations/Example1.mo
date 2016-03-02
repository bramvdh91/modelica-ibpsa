within Annex60.Fluid.Storage.Validations;
model Example1

  parameter Integer nTemp=19;

  Stratified tan(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    VTan=1.225*Modelica.Constants.pi*0.272^2,
    hTan=1.225,
    dIns=0.1,
    d=0.04,
    h_port_a=1.035,
    h_port_b=0.18,
    nSeg=50,
    T_start=287.9,
    vol(T_start={286.948930,287.080232,287.211533,287.342834,287.474135,
          287.605437,287.736738,287.654132,287.622444,287.820258,288.018073,
          288.215887,288.413702,288.518899,288.577629,288.654640,288.731650,
          288.808661,288.885672,288.937935,288.966625,288.987733,289.008841,
          289.029950,289.051058,289.097909,289.183703,289.236322,289.287893,
          289.339464,289.391035,289.399621,289.295173,289.305809,289.337244,
          289.368679,289.400114,289.412615,289.320352,289.323442,289.362793,
          289.402144,289.441495,289.476632,289.378324,289.394839,289.487254,
          289.579668,289.441251,289.290424}))
             annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{-34,0},{-14,20}})));
  replaceable package Medium = Annex60.Media.Water;
  Sources.Boundary_pT bou(          redeclare package Medium = Medium, nPorts=1)
    annotation (Placement(transformation(extent={{100,0},{80,20}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="data",
    columns=2:21,
    fileName="../TankData/test1.mat")
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Math.Add add[nTemp]
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
  Modelica.Blocks.Sources.Constant const(k=273.15)
    annotation (Placement(transformation(extent={{-100,14},{-80,34}})));
  Modelica.Blocks.Math.Gain lmin2kgs(k=1/60) "Conversion of liters to kg/s"
    annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  Sensors.TemperatureTwoPort senTemOut(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    tau=0) annotation (Placement(transformation(extent={{40,0},{60,20}})));
equation
  connect(tan.port_a, boundary.ports[1])
    annotation (Line(points={{0,10},{-8,10},{-14,10}}, color={0,127,255}));
  connect(lmin2kgs.y, boundary.m_flow_in) annotation (Line(points={{-47,0},{-42,
          0},{-42,18},{-34,18}}, color={0,0,127}));
  connect(tan.port_b, senTemOut.port_a)
    annotation (Line(points={{20,10},{30,10},{40,10}}, color={0,127,255}));
  connect(senTemOut.port_b, bou.ports[1])
    annotation (Line(points={{60,10},{70,10},{80,10}}, color={0,127,255}));
  connect(lmin2kgs.u, combiTimeTable.y[1])
    annotation (Line(points={{-70,0},{-79,0},{-79,50}}, color={0,0,127}));
  connect(add[1:nTemp].u1, combiTimeTable.y[2:nTemp+1]) annotation (Line(points={{-70,36},{-72,36},{
          -72,44},{-72,50},{-79,50}}, color={0,0,127}));

  for i in 1:nTemp loop
    connect(const.y, add[i].u2)
    annotation (Line(points={{-79,24},{-70,24}},          color={0,0,127}));
  end for;
  connect(boundary.T_in, add[1].y)
    annotation (Line(points={{-36,14},{-47,14},{-47,30}}, color={0,0,127}));
   annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=3000),
    __Dymola_experimentSetupOutput(events=false),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Fluid/Storage/Validation/Example1.mos"
        "Simulate and plot"));
end Example1;
