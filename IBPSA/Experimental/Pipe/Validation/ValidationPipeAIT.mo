within IBPSA.Experimental.Pipe.Validation;
model ValidationPipeAIT
  "Validation pipe against data from Austrian Institute of Technology"
  extends Modelica.Icons.Example;

  Fluid.Sources.MassFlowSource_T Point1(
    redeclare package Medium = Medium,
    use_T_in=true,
    use_m_flow_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,-42})));
  package Medium = IBPSA.Media.Water;
  Fluid.Sources.MassFlowSource_T Point4(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={8,88})));
  Fluid.Sources.MassFlowSource_T Point3(
    nPorts=1,
    redeclare package Medium = Medium,
    use_m_flow_in=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-46,-58})));
  Fluid.Sources.MassFlowSource_T Point2(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-88,82})));
  PipeHeatLossMod pip1(
    redeclare package Medium = Medium,
    diameter=0.0825,
    thicknessIns=0.045,
    lambdaI=0.024,
    length=115,
    allowFlowReversal=allowFlowReversal,
    nPorts=2,
    m_flow_nominal=0.3,
    R=1/(2*0.024*Modelica.Constants.pi)*log(0.18/0.0899) + 1/(2*2.4*Modelica.Constants.pi)
        *log(2/0.18),
    thickness=thickness)
    annotation (Placement(transformation(extent={{50,0},{30,20}})));
  PipeHeatLossMod pip4(
    redeclare package Medium = Medium,
    length=29,
    thicknessIns=0.045,
    lambdaI=0.024,
    allowFlowReversal=allowFlowReversal,
    m_flow_nominal=0.3,
    diameter(displayUnit="mm") = 0.0337 - 2*0.0032,
    thickness=thickness,
    nPorts=2,
    R=R80) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,40})));
    //R=1/0.208 + 1/(2*2.4*Modelica.Constants.pi)*log(1/0.18),
    //thicknessIns=0.045,
  PipeHeatLossMod pip5(
    redeclare package Medium = Medium,
    length=20,
    diameter=0.0825,
    lambdaI=0.024,
    thicknessIns=0.045,
    allowFlowReversal=allowFlowReversal,
    nPorts=2,
    m_flow_nominal=0.3,
    R=1/(2*0.024*Modelica.Constants.pi)*log(0.18/0.0899) + 1/(2*2.4*Modelica.Constants.pi)
        *log(2/0.18),
    thickness=thickness)
    annotation (Placement(transformation(extent={{0,0},{-20,20}})));
    //R=1/0.208 + 1/(2*2.4*Modelica.Constants.pi)*log(1/0.18),
  PipeHeatLossMod pip2(
    redeclare package Medium = Medium,
    length=76,
    thicknessIns=0.045,
    lambdaI=0.024,
    allowFlowReversal=allowFlowReversal,
    nPorts=1,
    m_flow_nominal=0.3,
    thickness=thickness,
    diameter=0.0337 - 2*0.0032,
    R=R80) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-88,30})));
    //R=1/0.208 + 1/(2*2.4*Modelica.Constants.pi)*log(1/0.18),
  PipeHeatLossMod pip3(
    redeclare package Medium = Medium,
    length=38,
    thicknessIns=0.045,
    lambdaI=0.024,
    allowFlowReversal=allowFlowReversal,
    nPorts=1,
    m_flow_nominal=0.3,
    thickness=thickness,
    diameter=0.0337 - 2*0.0032,
    R=R80) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-46,-4})));
  Modelica.Blocks.Sources.CombiTimeTable DataReader(table=pipeDataAIT151218.data)
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
  Data.PipeDataAIT151218 pipeDataAIT151218
    annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  Modelica.Blocks.Sources.RealExpression m_flow_p3(y=-DataReader.y[7])
    annotation (Placement(transformation(extent={{-100,-80},{-60,-60}})));
  Modelica.Blocks.Sources.RealExpression m_flow_p4(y=-DataReader.y[8])
    annotation (Placement(transformation(extent={{128,110},{88,130}})));
  Modelica.Blocks.Sources.RealExpression m_flow_p2(y=-DataReader.y[6])
    annotation (Placement(transformation(extent={{-14,90},{-54,110}})));
  Modelica.Blocks.Sources.RealExpression T_p1(y=DataReader.y[1])
    annotation (Placement(transformation(extent={{18,-74},{58,-54}})));
  Fluid.Sensors.TemperatureTwoPort senTem_p3(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    transferHeat=true,
    tauHeaTra=tauHeaTra) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-46,-34})));
  Fluid.Sensors.TemperatureTwoPort senTem_p2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    transferHeat=true,
    tauHeaTra=tauHeaTra) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-88,56})));
  Fluid.Sensors.TemperatureTwoPort senTem_p4(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    transferHeat=true,
    tauHeaTra=tauHeaTra) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={8,62})));
  Fluid.Sensors.TemperatureTwoPort senTem_p1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    transferHeat=true,
    tauHeaTra=tauHeaTra) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={34,-22})));
  PipeHeatLossMod pip0(
    redeclare package Medium = Medium,
    diameter=0.0825,
    thicknessIns=0.045,
    lambdaI=0.024,
    length=20,
    allowFlowReversal=allowFlowReversal,
    nPorts=2,
    m_flow_nominal=0.3,
    R=1/(2*0.024*Modelica.Constants.pi)*log(0.18/0.0899) + 1/(2*2.4*Modelica.Constants.pi)
        *log(2/0.18),
    thickness=thickness) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,-2})));
  Fluid.Sources.FixedBoundary ExcludedBranch(redeclare package Medium = Medium,
      nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,70})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
  Fluid.Sensors.TemperatureTwoPort senTemIn_p2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    transferHeat=true,
    tauHeaTra=tauHeaTra)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  parameter Modelica.SIunits.Length Lcap=1
    "Length over which transient effects typically take place";
  parameter Types.ThermalResistanceLength R80=1/(2*0.024*Modelica.Constants.pi)*log(0.07
      /0.0337) + 1/(2*2.4*Modelica.Constants.pi)*log(2/0.07);

  parameter Boolean pipVol=true
    "Flag to decide whether volumes are included at the end points of the pipe";
  parameter Boolean allowFlowReversal=true
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)";
  BaseClasses.SinglePipeConfig.IsoPlusSingleRigidStandard.IsoPlusKRE80S
    pipeData(
    Di=825e-3,
    lambdaI=0.024,
    Do=825e-3 + 2*pipeData.s + 2*45e-3)
    annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=1
    "Nominal mass flow rate, used for regularization near zero flow";
  parameter Modelica.SIunits.Time tauHeaTra=6500
    "Time constant for heat transfer, default 20 minutes";
  Modelica.Blocks.Logical.Switch switch
    annotation (Placement(transformation(extent={{54,96},{34,116}})));
  Modelica.Blocks.Sources.RealExpression m_flow_zero(y=0)
    annotation (Placement(transformation(extent={{134,88},{94,108}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=-0.001)
    annotation (Placement(transformation(extent={{78,104},{72,110}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{130,40},{110,60}})));
  Fluid.Sources.MassFlowSource_T Point5(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={46,56})));
  parameter Modelica.SIunits.Length thickness=0.0032 "Pipe wall thickness";
equation
  connect(m_flow_p3.y, Point3.m_flow_in) annotation (Line(
      points={{-58,-70},{-54,-70},{-54,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Point2.m_flow_in, m_flow_p2.y) annotation (Line(
      points={{-80,92},{-80,100},{-56,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_p1.y, Point1.T_in) annotation (Line(
      points={{60,-64},{78,-64},{78,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DataReader.y[5], Point1.m_flow_in) annotation (Line(
      points={{21,-90},{26,-90},{26,-72},{74,-72},{74,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DataReader.y[9], prescribedTemperature.T)
    annotation (Line(points={{21,-90},{30,-90},{38,-90}}, color={0,0,127}));
  connect(pip4.heatPort, pip1.heatPort) annotation (Line(points={{20,40},{20,40},
          {40,40},{40,20}}, color={191,0,0}));
  connect(pip1.heatPort, pip0.heatPort) annotation (Line(points={{40,20},{40,26},
          {100,26},{100,-2},{90,-2}}, color={191,0,0}));
  connect(pip1.heatPort, pip2.heatPort) annotation (Line(points={{40,20},{40,26},
          {-54,26},{-54,30},{-78,30}}, color={191,0,0}));
  connect(pip5.heatPort, pip2.heatPort) annotation (Line(points={{-10,20},{-10,26},
          {-54,26},{-54,30},{-78,30}}, color={191,0,0}));
  connect(pip3.heatPort, pip2.heatPort) annotation (Line(points={{-36,-4},{-28,-4},
          {-28,26},{-54,26},{-54,30},{-78,30}}, color={191,0,0}));
  connect(prescribedTemperature.port, pip0.heatPort) annotation (Line(points={{60,
          -90},{100,-90},{100,-2},{90,-2}}, color={191,0,0}));
  connect(senTem_p2.port_b, Point2.ports[1]) annotation (Line(points={{-88,66},{
          -88,66},{-88,70},{-88,72}}, color={0,127,255}));
  connect(Point3.ports[1], senTem_p3.port_b)
    annotation (Line(points={{-46,-48},{-46,-44}}, color={0,127,255}));
  connect(senTem_p4.port_b, Point4.ports[1])
    annotation (Line(points={{8,72},{8,68},{8,78}}, color={0,127,255}));
  connect(Point1.ports[1], senTem_p1.port_b)
    annotation (Line(points={{82,-32},{82,-32},{34,-32}}, color={0,127,255}));
  connect(senTem_p1.port_a, pip0.port_a)
    annotation (Line(points={{34,-12},{70,-12},{80,-12}}, color={0,127,255}));
  connect(switch.u1, m_flow_p4.y) annotation (Line(points={{56,114},{72,114},{72,
          120},{86,120}}, color={0,0,127}));
  connect(m_flow_zero.y, switch.u3)
    annotation (Line(points={{92,98},{92,98},{56,98}}, color={0,0,127}));
  connect(switch.y, Point4.m_flow_in)
    annotation (Line(points={{33,106},{16,106},{16,98}}, color={0,0,127}));
  connect(switch.u2, lessThreshold.y) annotation (Line(points={{56,106},{71.7,106},
          {71.7,107}}, color={255,0,255}));
  connect(lessThreshold.u, m_flow_p4.y) annotation (Line(points={{78.6,107},{78.6,
          120},{86,120}}, color={0,0,127}));
  connect(pip1.port_a, pip0.ports_b[1])
    annotation (Line(points={{50,10},{78,10},{78,8}}, color={0,127,255}));
  connect(pip1.ports_b[1], pip4.port_a)
    annotation (Line(points={{30,8},{10,8},{10,30}},
                                                   color={0,127,255}));
  connect(pip5.port_a, pip1.ports_b[2])
    annotation (Line(points={{0,10},{30,10},{30,12}}, color={0,127,255}));
  connect(pip4.ports_b[1], senTem_p4.port_a)
    annotation (Line(points={{8,50},{8,52},{8,52}}, color={0,127,255}));
  connect(Point5.ports[1], pip4.ports_b[2]) annotation (Line(points={{36,56},{
          36,56},{12,56},{12,50}},
                                color={0,127,255}));
  connect(pip5.ports_b[1], senTemIn_p2.port_b)
    annotation (Line(points={{-20,8},{-60,8},{-60,10}}, color={0,127,255}));
  connect(pip3.port_a, pip5.ports_b[2])
    annotation (Line(points={{-46,6},{-46,12},{-20,12}}, color={0,127,255}));
  connect(senTemIn_p2.port_a, pip2.port_a)
    annotation (Line(points={{-80,10},{-88,10},{-88,20}}, color={0,127,255}));
  connect(pip2.ports_b[1], senTem_p2.port_a)
    annotation (Line(points={{-88,40},{-88,43},{-88,46}}, color={0,127,255}));
  connect(pip3.ports_b[1], senTem_p3.port_a) annotation (Line(points={{-46,-14},
          {-46,-14},{-46,-24}}, color={0,127,255}));
  connect(ExcludedBranch.ports[1], pip0.ports_b[2]) annotation (Line(points={{80,
          60},{82,60},{82,8},{82,8}}, color={0,127,255}));
  connect(switch1.y, Point5.m_flow_in) annotation (Line(points={{109,50},{84,50},
          {84,64},{56,64}}, color={0,0,127}));
  connect(m_flow_p4.y, switch1.u3) annotation (Line(points={{86,120},{86,120},{86,
          112},{86,88},{106,88},{144,88},{144,42},{132,42}}, color={0,0,127}));
  connect(m_flow_zero.y, switch1.u1) annotation (Line(points={{92,98},{94,98},{94,
          84},{94,80},{136,80},{136,58},{132,58}}, color={0,0,127}));
  connect(lessThreshold.y, switch1.u2) annotation (Line(points={{71.7,107},{66,107},
          {66,84},{140,84},{140,50},{132,50}}, color={255,0,255}));
  annotation (
    experiment(StopTime=603900, Interval=900),
    __Dymola_experimentSetupOutput(events=false),
    Documentation(info="<html>
<p>The example contains <a href=\"modelica://IBPSA.Experimental.Pipe.Data.PipeDataAIT151218\">experimental data</a> from a real district heating network. This data is used to validate a pipe model.</p>
<p>Pipes&apos; temperatures are not initialized, thus results of outflow temperature before apprixmately the first 10000 seconds should no be considered. </p>
<p><b><span style=\"color: #008000;\">Test bench schematic</span></b> </p>
<p><img src=\"modelica://IBPSA/Resources/Images/Experimental/AITTestBench.png\"/> </p>
<p><b><span style=\"color: #008000;\">Calibration</span></b> </p>
<p>To calculate the length specific thermal resistance <code><span style=\"font-family: Courier New,courier;\">R</span></code> of the pipe, the thermal resistance of the surrounding ground is added. </p>
<p><code><span style=\"font-family: Courier New,courier;\">R=1/(0.208)+1/(2*lambda_g*Modelica.Constants.pi)*log(1/0.18)</span></code> </p>
<p>Where the thermal conductivity of the ground <code><span style=\"font-family: Courier New,courier;\">lambda_g = 2.4 </span></code>W/mK. </p>
<p><br><h4><span style=\"color: #008000\">Testing spatialDistribution influence on non-linear systems</span></h4></p>
<p>The model contains two parameters on the top level:</p>
<p><code><span style=\"font-family: Courier New,courier; color: #0000ff;\">parameter&nbsp;</span><span style=\"color: #ff0000;\">Boolean</span>&nbsp;pipVol=false&nbsp;</p><p><span style=\"font-family: Courier New,courier; color: #006400;\">&nbsp;&nbsp;&nbsp;&nbsp;&QUOT;Flag&nbsp;to&nbsp;decide&nbsp;whether&nbsp;volumes&nbsp;are&nbsp;included&nbsp;at&nbsp;the&nbsp;end&nbsp;points&nbsp;of&nbsp;the&nbsp;pipe&QUOT;</span>;</code></p>
<p><code><span style=\"font-family: Courier New,courier; color: #0000ff;\">parameter&nbsp;</span><span style=\"color: #ff0000;\">Boolean</span>&nbsp;allowFlowReversal=true&nbsp;</code></p>
<p><code><span style=\"font-family: Courier New,courier; color: #006400;\">&nbsp;&nbsp;&nbsp;&nbsp;&QUOT;=&nbsp;true&nbsp;to&nbsp;allow&nbsp;flow&nbsp;reversal,&nbsp;false&nbsp;restricts&nbsp;to&nbsp;design&nbsp;direction&nbsp;(port_a&nbsp;-&GT;&nbsp;port_b)&QUOT;</span>;</code></p>
<p><br><code><span style=\"font-family: Courier New,courier;\">pipVol </span></code>controls the presence of two additional mixing volumes at the in/outlets of <code><span style=\"font-family: Courier New,courier;\">PipeAdiabaticPlugFlow.</span></code> <code><span style=\"font-family: Courier New,courier;\">allowFlowReversal</span></code> controls whether flow reversal is allowed in the same component.</p>
<p><br>Below, the model translation statistics for different combinations of these parameters are presented:</p>
<p style=\"margin-left: 30px;\"><br><h4>pipVol=true, allowFlowReversal=true</h4></p>
<p style=\"margin-left: 30px;\">Translated Model</p>
<p style=\"margin-left: 30px;\">Constants: 1090 scalars</p>
<p style=\"margin-left: 30px;\">Free parameters: 6981 scalars</p>
<p style=\"margin-left: 30px;\">Parameter depending: 6928 scalars</p>
<p style=\"margin-left: 30px;\">Continuous time states: 30 scalars</p>
<p style=\"margin-left: 30px;\">Time-varying variables: 524 scalars</p>
<p style=\"margin-left: 30px;\">Alias variables: 616 scalars</p>
<p style=\"margin-left: 30px;\">Assumed default initial conditions: 66</p>
<p style=\"margin-left: 30px;\">Number of mixed real/discrete systems of equations: 0</p>
<p style=\"margin-left: 30px;\">Sizes of linear systems of equations: { }</p>
<p style=\"margin-left: 30px;\">Sizes after manipulation of the linear systems: { }</p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes of nonlinear systems of equations: { }</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes after manipulation of the nonlinear systems: { }</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Number of numerical Jacobians: 0</span></h4></p>
<p style=\"margin-left: 30px;\"><br><h4>pipVol=false, allowFlowReversal=true</h4></p>
<p style=\"margin-left: 30px;\">Translated Model</p>
<p style=\"margin-left: 30px;\">Constants: 500 scalars</p>
<p style=\"margin-left: 30px;\">Free parameters: 6946 scalars</p>
<p style=\"margin-left: 30px;\">Parameter depending: 6863 scalars</p>
<p style=\"margin-left: 30px;\">Continuous time states: 18 scalars</p>
<p style=\"margin-left: 30px;\">Time-varying variables: 409 scalars</p>
<p style=\"margin-left: 30px;\">Alias variables: 364 scalars</p>
<p style=\"margin-left: 30px;\">Assumed default initial conditions: 54</p>
<p style=\"margin-left: 30px;\">Number of mixed real/discrete systems of equations: 0</p>
<p style=\"margin-left: 30px;\">Sizes of linear systems of equations: { }</p>
<p style=\"margin-left: 30px;\">Sizes after manipulation of the linear systems: { }</p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes of nonlinear systems of equations: {44}</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes after manipulation of the nonlinear systems: {5}</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Number of numerical Jacobians: 1</span></h4></p>
<p style=\"margin-left: 30px;\"><br><h4>pipVol=false, allowFlowReversal=false</h4></p>
<p style=\"margin-left: 30px;\">Translated Model</p>
<p style=\"margin-left: 30px;\">Constants: 500 scalars</p>
<p style=\"margin-left: 30px;\">Free parameters: 6946 scalars</p>
<p style=\"margin-left: 30px;\">Parameter depending: 6866 scalars</p>
<p style=\"margin-left: 30px;\">Continuous time states: 18 scalars</p>
<p style=\"margin-left: 30px;\">Time-varying variables: 399 scalars</p>
<p style=\"margin-left: 30px;\">Alias variables: 371 scalars</p>
<p style=\"margin-left: 30px;\">Assumed default initial conditions: 54</p>
<p style=\"margin-left: 30px;\">Number of mixed real/discrete systems of equations: 0</p>
<p style=\"margin-left: 30px;\">Sizes of linear systems of equations: { }</p>
<p style=\"margin-left: 30px;\">Sizes after manipulation of the linear systems: { }</p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes of nonlinear systems of equations: {5, 5}</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes after manipulation of the nonlinear systems: {1, 1}</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Number of numerical Jacobians: 2</span></h4></p>
<p style=\"margin-left: 30px;\"><br><h4>pipVol=true, allowFlowReversal=false</h4></p>
<p style=\"margin-left: 30px;\">Translated Model</p>
<p style=\"margin-left: 30px;\">Constants: 1090 scalars</p>
<p style=\"margin-left: 30px;\">Free parameters: 6981 scalars</p>
<p style=\"margin-left: 30px;\">Parameter depending: 6932 scalars</p>
<p style=\"margin-left: 30px;\">Continuous time states: 30 scalars</p>
<p style=\"margin-left: 30px;\">Time-varying variables: 513 scalars</p>
<p style=\"margin-left: 30px;\">Alias variables: 623 scalars</p>
<p style=\"margin-left: 30px;\">Assumed default initial conditions: 66</p>
<p style=\"margin-left: 30px;\">Number of mixed real/discrete systems of equations: 0</p>
<p style=\"margin-left: 30px;\">Sizes of linear systems of equations: { }</p>
<p style=\"margin-left: 30px;\">Sizes after manipulation of the linear systems: { }</p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes of nonlinear systems of equations: { }</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Sizes after manipulation of the nonlinear systems: { }</span></h4></p>
<p style=\"margin-left: 30px;\"><h4><span style=\"color: #008000\">Number of numerical Jacobians: 0</span></h4></p>
<p><br>It seems that when the solver has to account for the possibility of flow reversal (aFV=true) and the model includes no additional state for the water in the pipe (pipVol = false), very large nonlinear systems appear when translating. However, the advection equation, implemented by the <code><span style=\"font-family: Courier New,courier;\">spatialDistribution</span></code> function should inherently introduce a state. This state is clearly not recognized by the model translator. We see that if additional volumes are introduced, or if flow reversal is disabled the non-linear system is smaller or entirely eliminated. </p>
</html>", revisions="<html>
<ul>
<li>July 4, 2016 by Bram van der Heijde:<br>Added parameters to test the influence of allowFlowReversal and the presence of explicit volumes in the pipe.</li>
<li>January 26, 2016 by Carles Ribas:<br>First implementation. </li>
</ul>
</html>"),
    __Dymola_Commands(file=
          "modelica://IBPSA/Resources/Scripts/Dymola/Experimental/Pipe/Validation/ValidationPipeAIT.mos"
        "Simulate and plot"),
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=true,
      OutputFlatModelica=false));
end ValidationPipeAIT;
