within IBPSA.Experimental.Pipe.Examples.Vector;
model Vector_test_1
  "First test of a comparison between pipe models and experimental data from ULg"
  import IBPSA;
  extends Modelica.Icons.Example;

  package Medium = IBPSA.Media.Water;

  output Modelica.SIunits.Temperature TOutExperimental
    "Outlet water temperature from experimental data";

  parameter Modelica.SIunits.Diameter diameter=0.05248 "Pipe diameter";
  parameter Modelica.SIunits.Length length=39 "Pipe length";

  parameter Modelica.SIunits.Pressure dp_test = 200
    "Differential pressure for the test used in ramps";

  Modelica.Blocks.Sources.Constant PAtm(k=101325) "Atmospheric pressure"
      annotation (Placement(transformation(extent={{126,76},{146,96}})));

  IBPSA.Fluid.Sources.Boundary_pT sin1(          redeclare package Medium =
        Medium,
    nPorts=1,
    use_p_in=true,
    T=283.15)
    "Sink at with constant pressure, turns into source at the end of experiment"
                          annotation (Placement(transformation(extent={{140,28},
            {120,48}})));
  IBPSA.Fluid.Sensors.MassFlowRate masFloA60(redeclare package Medium =
        Medium) "Mass flow rate sensor for the A60 temperature delay"
    annotation (Placement(transformation(extent={{88,30},{108,50}})));

  IBPSA.Experimental.Pipe.Archive.PipeHeatLossA60Ref A60PipeHeatLoss(
    redeclare package Medium = Medium,
    m_flow_small=1e-4*0.5,
    diameter=diameter,
    length=length,
    m_flow_nominal=0.5,
    thicknessIns=0.02,
    thermTransmissionCoeff=0.03) "Annex 60 pipe with heat losses"
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  IBPSA.Fluid.Sensors.TemperatureTwoPort senTemA60Out(redeclare package
      Medium = Medium, m_flow_nominal=0.5)
    "Temperature sensor for the outflow of the A60 temperature delay"
    annotation (Placement(transformation(extent={{56,30},{76,50}})));
  IBPSA.Fluid.Sensors.TemperatureTwoPort senTemA60In(redeclare package Medium
      = Medium, m_flow_nominal=0.5)
    "Temperature of the inflow to the A60 temperature delay"
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  IBPSA.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    nPorts=1,
    use_m_flow_in=true,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=
        pipeDataULg150801_1.data)
    annotation (Placement(transformation(extent={{-200,40},{-180,60}})));
  IBPSA.Experimental.Pipe.Data.PipeDataULg150801 pipeDataULg150801_1
    annotation (Placement(transformation(extent={{-160,80},{-140,100}})));
  Modelica.Blocks.Math.Gain gain(k=2)
    annotation (Placement(transformation(extent={{-120,12},{-108,24}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-166,4},{-146,24}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15)
    annotation (Placement(transformation(extent={{-200,-2},{-180,18}})));
equation
    TOutExperimental = combiTimeTable.y[3] + 273.15;
  connect(PAtm.y, sin1.p_in)
                            annotation (Line(points={{147,86},{154,86},{154,46},
          {142,46}},
                   color={0,0,127}));
  connect(sin1.ports[1],masFloA60. port_b) annotation (Line(
      points={{120,38},{114,38},{114,40},{108,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(A60PipeHeatLoss.port_b, senTemA60Out.port_a) annotation (Line(
      points={{40,40},{56,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(masFloA60.port_a,senTemA60Out. port_b) annotation (Line(
      points={{88,40},{76,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemA60In.port_b, A60PipeHeatLoss.port_a)
    annotation (Line(points={{-40,40},{20,40}}, color={0,127,255}));
  connect(boundary.ports[1], senTemA60In.port_a)
    annotation (Line(points={{-80,10},{-60,40}}, color={0,127,255}));
  connect(boundary.m_flow_in, gain.y)
    annotation (Line(points={{-100,18},{-107.4,18}}, color={0,0,127}));
  connect(combiTimeTable.y[1], gain.u) annotation (Line(points={{-179,50},{-132,
          50},{-132,18},{-121.2,18}}, color={0,0,127}));
  connect(const1.y, add.u2)
    annotation (Line(points={{-179,8},{-168,8}}, color={0,0,127}));
  connect(combiTimeTable.y[5], add.u1) annotation (Line(points={{-179,50},{-174,
          50},{-174,20},{-168,20}}, color={0,0,127}));
  connect(add.y, boundary.T_in)
    annotation (Line(points={{-145,14},{-102,14}}, color={0,0,127}));
    annotation (experiment(StopTime=875, __Dymola_NumberOfIntervals=5000),
__Dymola_Commands(file="modelica://IBPSA/Resources/Scripts/Dymola/Experimental/PipeAdiabatic/PipeAdiabatic_TStep.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},{160,
            100}})),
    Documentation(info="<html>
<p>This example compares the KUL and A60 pipe heat loss implementations with experimental data from the ULg test bench.</p>
<p>This is only a first glimpse at the general behavior. Next step is to parameterize both models with comparable heat insulation properties. </p>
</html>", revisions="<html>
<ul>
<li>
October 1, 2015 by Marcus Fuchs:<br/>
First implementation.
</li>
</ul>
</html>"),
    __Dymola_experimentSetupOutput);
end Vector_test_1;
