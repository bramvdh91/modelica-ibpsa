within IBPSA.Experimental.Pipe.Data;
record FlowRateGeneric
  "Mass flow rate for example building's demand based on building simulation using TEASER and AixLib"
   extends IBPSA.Experimental.Pipe.Data.BaseClasses.PipeDataBaseDefinition(final n=1, data=[
    0, 0.445;
    3600, 0.478;
    7200, 0.482;
    10800, 0.465;
    14400, 0.458;
    18000, 0.464;
    21600, 0.45;
    25200, 0.371;
    28800, 0.344;
    32400, 0.306;
    36000, 0.292;
    39600, 0.287;
    43200, 0.296;
    46800, 0.315;
    50400, 0.292;
    54000, 0.268;
    57600, 0.274;
    61200, 0.315;
    64800, 0.383;
    68400, 0.451;
    72000, 0.46;
    75600, 0.47;
    79200, 0.518;
    82800, 0.52;
    86400, 0.538;
    90000, 0.566;
    93600, 0.564;
    97200, 0.569;
    100800, 0.563;
    104400, 0.578;
    108000, 0.574;
    111600, 0.483;
    115200, 0.444;
    118800, 0.386;
    122400, 0.358;
    126000, 0.345;
    129600, 0.356;
    133200, 0.365;
    136800, 0.305;
    140400, 0.262;
    144000, 0.316;
    147600, 0.366;
    151200, 0.412;
    154800, 0.47;
    158400, 0.459;
    162000, 0.462;
    165600, 0.485;
    169200, 0.473;
    172800, 0.465;
    176400, 0.479;
    180000, 0.456;
    183600, 0.461;
    187200, 0.455;
    190800, 0.45;
    194400, 0.453;
    198000, 0.386;
    201600, 0.35;
    205200, 0.315;
    208800, 0.311;
    212400, 0.302;
    216000, 0.316;
    219600, 0.343;
    223200, 0.316;
    226800, 0.291;
    230400, 0.291;
    234000, 0.319;
    237600, 0.346;
    241200, 0.392;
    244800, 0.397;
    248400, 0.401;
    252000, 0.428;
    255600, 0.441;
    259200, 0.443;
    262800, 0.455;
    266400, 0.452;
    270000, 0.457;
    273600, 0.458;
    277200, 0.456;
    280800, 0.454;
    284400, 0.382;
    288000, 0.355;
    291600, 0.329;
    295200, 0.316;
    298800, 0.281;
    302400, 0.304;
    306000, 0.321;
    309600, 0.295;
    313200, 0.274;
    316800, 0.288;
    320400, 0.337;
    324000, 0.376;
    327600, 0.43;
    331200, 0.432;
    334800, 0.435;
    338400, 0.465;
    342000, 0.464;
    345600, 0.463;
    349200, 0.467;
    352800, 0.47;
    356400, 0.475;
    360000, 0.478;
    363600, 0.479;
    367200, 0.479;
    370800, 0.404;
    374400, 0.371;
    378000, 0.338;
    381600, 0.336;
    385200, 0.329;
    388800, 0.35;
    392400, 0.371;
    396000, 0.339;
    399600, 0.313;
    403200, 0.323;
    406800, 0.352;
    410400, 0.379;
    414000, 0.431;
    417600, 0.44;
    421200, 0.439;
    424800, 0.467;
    428400, 0.483;
    432000, 0.476;
    435600, 0.482;
    439200, 0.485;
    442800, 0.492;
    446400, 0.515;
    450000, 0.531;
    453600, 0.538;
    457200, 0.441;
    460800, 0.396;
    464400, 0.355;
    468000, 0.342;
    471600, 0.331;
    475200, 0.34;
    478800, 0.348;
    482400, 0.329;
    486000, 0.303;
    489600, 0.303;
    493200, 0.332;
    496800, 0.358;
    500400, 0.414;
    504000, 0.414;
    507600, 0.42;
    511200, 0.479;
    514800, 0.471;
    518400, 0.474;
    522000, 0.477;
    525600, 0.469;
    529200, 0.469;
    532800, 0.466;
    536400, 0.461;
    540000, 0.462;
    543600, 0.393;
    547200, 0.368;
    550800, 0.334;
    554400, 0.326;
    558000, 0.293;
    561600, 0.296;
    565200, 0.279;
    568800, 0.243;
    572400, 0.218;
    576000, 0.259;
    579600, 0.292;
    583200, 0.32;
    586800, 0.377;
    590400, 0.372;
    594000, 0.38;
    597600, 0.405;
    601200, 0.422]);
  annotation (Documentation(info="<html>
<p>This file contains 1 week of hourly mass flow rates for a building substation. </p>
<p>The values were calculated based on a large residential building simulated with TEASER and AixLib. Based on the simulated heat demand, the mass flow rate was calculated assuming a network supply temperature of 60 degC and a return temperature of 40 degC.</p>
</html>", revisions="<html>
<ul>
<li>
December 8, 2016 by Marcus Fuchs:<br/>
First implementation.
</li>
</ul>
</html>"));
end FlowRateGeneric;
