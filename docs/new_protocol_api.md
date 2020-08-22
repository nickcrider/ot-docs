
<div>
 
  
<span id="protocol-api-reference"></span><h1 id="index--page-root">API Version 2 Reference<a class="headerlink" href="#index--page-root" title="Permalink to this headline">¶</a></h1>
<em>Version: {! version_info/build.txt !}</em>
<span id="protocols-and-instruments"></span><span id="protocol-api-protocols-and-instruments"></span><h2 id="module-opentrons.protocol_api.contexts">Protocols and Instruments<a class="headerlink" href="#module-opentrons.protocol_api.contexts" title="Permalink to this headline">¶</a></h2>
<dl class="class">
<dt id="opentrons.protocol_api.contexts.ProtocolContext">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.contexts.</code><code class="sig-name descname">ProtocolContext</code><span class="sig-paren">(</span><em class="sig-param">loop: asyncio.events.AbstractEventLoop = None</em>, <em class="sig-param">hardware: Union[opentrons.hardware_control.thread_manager.ThreadManager</em>, <em class="sig-param">opentrons.hardware_control.adapters.SynchronousAdapter</em>, <em class="sig-param">HasLoop] = None</em>, <em class="sig-param">broker=None</em>, <em class="sig-param">bundled_labware: Dict[str</em>, <em class="sig-param">LabwareDefinition] = None</em>, <em class="sig-param">bundled_data: Dict[str</em>, <em class="sig-param">bytes] = None</em>, <em class="sig-param">extra_labware: Dict[str</em>, <em class="sig-param">LabwareDefinition] = None</em>, <em class="sig-param">api_version: opentrons.protocols.types.APIVersion = None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext" title="Permalink to this definition">¶</a></dt>
<dd><p>The Context class is a container for the state of a protocol.</p>
<p>It encapsulates many of the methods formerly found in the Robot class,
including labware, instrument, and module loading, as well as core
functions like pause and resume.</p>
<p>Unlike the old robot class, it is designed to be ephemeral. The lifetime
of a particular instance should be about the same as the lifetime of a
protocol. The only exception is the one stored in
<code class="xref py py-attr docutils literal notranslate"><span class="pre">legacy_api.api.robot</span></code>, which is provided only for back
compatibility and should be used less and less as time goes by.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.api_version" title="Permalink to this definition">¶</a></dt>
<dd><p>Return the API version supported by this protocol context.</p>
<p>The supported API version was specified when the protocol context
was initialized. It may be lower than the highest version supported
by the robot software. For the highest version supported by the
robot software, see <code class="xref py py-attr docutils literal notranslate"><span class="pre">protocol_api.MAX_SUPPORTED_VERSION</span></code>.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.build_using">
<em class="property">classmethod </em><code class="sig-name descname">build_using</code><span class="sig-paren">(</span><em class="sig-param">protocol: Union[opentrons.protocols.types.JsonProtocol, opentrons.protocols.types.PythonProtocol], *args, **kwargs</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.build_using" title="Permalink to this definition">¶</a></dt>
<dd><p>Build an API instance for the specified parsed protocol</p>
<p>This is used internally to provision the context with bundle
contents or api levels.</p>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.bundled_data">
<em class="property">property </em><code class="sig-name descname">bundled_data</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.bundled_data" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor for data files bundled with this protocol, if any.</p>
<p>This is a dictionary mapping the filenames of bundled datafiles, with
extensions but without paths (e.g. if a file is stored in the bundle as
<code class="docutils literal notranslate"><span class="pre">data/mydata/aspirations.csv</span></code> it will be in the dict as
<code class="docutils literal notranslate"><span class="pre">'aspirations.csv'</span></code>) to the bytes contents of the files.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.cleanup">
<code class="sig-name descname">cleanup</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.cleanup" title="Permalink to this definition">¶</a></dt>
<dd><p>Finalize and clean up the protocol context.</p>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.clear_commands">
<code class="sig-name descname">clear_commands</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.clear_commands" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.commands">
<code class="sig-name descname">commands</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.commands" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.comment">
<code class="sig-name descname">comment</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">msg</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.comment" title="Permalink to this definition">¶</a></dt>
<dd><p>Add a user-readable comment string that will be echoed to the Opentrons
app.</p>
<p>The value of the message is computed during protocol simulation,
so cannot be used to communicate real-time information from the robot’s
actual run.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.connect">
<code class="sig-name descname">connect</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">hardware: opentrons.hardware_control.api.API</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.connect" title="Permalink to this definition">¶</a></dt>
<dd><p>Connect to a running hardware API.</p>
<p>This can be either a simulator or a full hardware controller.</p>
<p>Note that there is no true disconnected state for a
<a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext" title="opentrons.protocol_api.contexts.ProtocolContext"><code class="xref py py-class docutils literal notranslate"><span class="pre">ProtocolContext</span></code></a>; <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.disconnect" title="opentrons.protocol_api.contexts.ProtocolContext.disconnect"><code class="xref py py-meth docutils literal notranslate"><span class="pre">disconnect()</span></code></a> simply creates
a new simulator and replaces the current hardware with it.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.deck">
<em class="property">property </em><code class="sig-name descname">deck</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.deck" title="Permalink to this definition">¶</a></dt>
<dd><p>The object holding the deck layout of the robot.</p>
<p>This object behaves like a dictionary with keys for both numeric
and string slot numbers (for instance, <code class="docutils literal notranslate"><span class="pre">protocol.deck[1]</span></code> and
<code class="docutils literal notranslate"><span class="pre">protocol.deck['1']</span></code> will both return the object in slot 1). If
nothing is loaded into a slot, <code class="docutils literal notranslate"><span class="pre">None</span></code> will be present. This object
is useful for determining if a slot in the deck is free. Rather than
filtering the objects in the deck map yourself, you can also use
<a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.loaded_labwares" title="opentrons.protocol_api.contexts.ProtocolContext.loaded_labwares"><code class="xref py py-attr docutils literal notranslate"><span class="pre">loaded_labwares</span></code></a> to see a dict of labwares and
<a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.loaded_modules" title="opentrons.protocol_api.contexts.ProtocolContext.loaded_modules"><code class="xref py py-attr docutils literal notranslate"><span class="pre">loaded_modules</span></code></a> to see a dict of modules.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.delay">
<code class="sig-name descname">delay</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">seconds=0</em>, <em class="sig-param">minutes=0</em>, <em class="sig-param">msg=None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.delay" title="Permalink to this definition">¶</a></dt>
<dd><p>Delay protocol execution for a specific amount of time.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>seconds</strong> (<em>float</em>) – A time to delay in seconds</p></li>
<li><p><strong>minutes</strong> (<em>float</em>) – A time to delay in minutes</p></li>
</ul>
</dd>
</dl>
<p>If both <cite>seconds</cite> and <cite>minutes</cite> are specified, they will be added.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.disconnect">
<code class="sig-name descname">disconnect</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.disconnect" title="Permalink to this definition">¶</a></dt>
<dd><p>Disconnect from currently-connected hardware and simulate instead</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.door_closed">
<em class="property">property </em><code class="sig-name descname">door_closed</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.door_closed" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns True if the robot door is closed</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.5.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.fixed_trash">
<em class="property">property </em><code class="sig-name descname">fixed_trash</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.fixed_trash" title="Permalink to this definition">¶</a></dt>
<dd><p>The trash fixed to slot 12 of the robot deck.</p>
<p>It has one well and should be accessed like labware in your protocol.
e.g. <code class="docutils literal notranslate"><span class="pre">protocol.fixed_trash['A1']</span></code></p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.home">
<code class="sig-name descname">home</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.home" title="Permalink to this definition">¶</a></dt>
<dd><p>Homes the robot.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.is_simulating">
<code class="sig-name descname">is_simulating</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → bool<a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.is_simulating" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.load_instrument">
<code class="sig-name descname">load_instrument</code><span class="sig-paren">(</span><em class="sig-param">self, instrument_name: str, mount: Union[opentrons.types.Mount, str], tip_racks: List[opentrons.protocol_api.labware.Labware] = None, replace: bool = False</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.load_instrument" title="Permalink to this definition">¶</a></dt>
<dd><p>Load a specific instrument required by the protocol.</p>
<p>This value will actually be checked when the protocol runs, to
ensure that the correct instrument is attached in the specified
location.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>instrument_name</strong> (<em>str</em>) – The name of the instrument model, or a
prefix. For instance, ‘p10_single’ may be
used to request a P10 single regardless of
the version.</p></li>
<li><p><strong>mount</strong> (<a class="reference internal" href="#opentrons.types.Mount" title="opentrons.types.Mount"><em>types.Mount</em></a><em> or </em><em>str</em>) – The mount in which this instrument should be attached.
This can either be an instance of the enum type
<a class="reference internal" href="#opentrons.types.Mount" title="opentrons.types.Mount"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.Mount</span></code></a> or one of the strings <cite>‘left’</cite>
and <cite>‘right’</cite>.</p></li>
<li><p><strong>tip_racks</strong> (List[<a class="reference internal" href="#opentrons.protocol_api.labware.Labware" title="opentrons.protocol_api.labware.Labware"><code class="xref py py-class docutils literal notranslate"><span class="pre">Labware</span></code></a>]) – A list of tip racks from which to pick tips if
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.pick_up_tip" title="opentrons.protocol_api.contexts.InstrumentContext.pick_up_tip"><code class="xref py py-meth docutils literal notranslate"><span class="pre">InstrumentContext.pick_up_tip()</span></code></a> is called
without arguments.</p></li>
<li><p><strong>replace</strong> (<em>bool</em>) – Indicate that the currently-loaded instrument in
<cite>mount</cite> (if such an instrument exists) should be
replaced by <cite>instrument_name</cite>.</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.load_labware">
<code class="sig-name descname">load_labware</code><span class="sig-paren">(</span><em class="sig-param">self, load_name: str, location: Union[int, str], label: str = None, namespace: str = None, version: int = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.load_labware" title="Permalink to this definition">¶</a></dt>
<dd><p>Load a labware onto the deck given its name.</p>
<p>For labware already defined by Opentrons, this is a convenient way
to collapse the two stages of labware initialization (creating
the labware and adding it to the protocol) into one.</p>
<p>This function returns the created and initialized labware for use
later in the protocol.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>load_name</strong> – A string to use for looking up a labware definition</p></li>
<li><p><strong>location</strong> (<em>int</em><em> or </em><em>str</em>) – The slot into which to load the labware such as
1 or ‘1’</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear
as in the run log and the calibration view in the
Opentrons app.</p></li>
<li><p><strong>namespace</strong> (<em>str</em>) – The namespace the labware definition belongs to.
If unspecified, will search ‘opentrons’ then ‘custom_beta’</p></li>
<li><p><strong>version</strong> (<em>int</em>) – The version of the labware definition. If
unspecified, will use version 1.</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.load_labware_by_name">
<code class="sig-name descname">load_labware_by_name</code><span class="sig-paren">(</span><em class="sig-param">self, load_name: str, location: Union[int, str], label: str = None, namespace: str = None, version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.load_labware_by_name" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.load_labware_from_definition">
<code class="sig-name descname">load_labware_from_definition</code><span class="sig-paren">(</span><em class="sig-param">self, labware_def: 'LabwareDefinition', location: Union[int, str], label: str = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.load_labware_from_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a piece of labware on the OT2 deck.</p>
<p>This function loads the labware definition specified by <cite>labware_def</cite>
to the location specified by <cite>location</cite>.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>labware_def</strong> – The labware definition to load</p></li>
<li><p><strong>location</strong> (<em>int</em><em> or </em><em>str</em>) – The slot into which to load the labware such as
1 or ‘1’</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear
as in the run log and the calibration view in the
Opentrons app.</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.load_module">
<code class="sig-name descname">load_module</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">module_name: str</em>, <em class="sig-param">location: Union[int</em>, <em class="sig-param">str</em>, <em class="sig-param">NoneType] = None</em>, <em class="sig-param">configuration: str = None</em><span class="sig-paren">)</span> → Union[ForwardRef('TemperatureModuleContext'), ForwardRef('MagneticModuleContext'), ForwardRef('ThermocyclerContext')]<a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.load_module" title="Permalink to this definition">¶</a></dt>
<dd><p>Load a module onto the deck given its name.</p>
<p>This is the function to call to use a module in your protocol, like
<a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_instrument" title="opentrons.protocol_api.contexts.ProtocolContext.load_instrument"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_instrument()</span></code></a> is the method to call to use an instrument
in your protocol. It returns the created and initialized module
context, which will be a different class depending on the kind of
module loaded.</p>
<p>A map of deck positions to loaded modules can be accessed later
using <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.loaded_modules" title="opentrons.protocol_api.contexts.ProtocolContext.loaded_modules"><code class="xref py py-attr docutils literal notranslate"><span class="pre">loaded_modules</span></code></a>.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>module_name</strong> (<em>str</em>) – The name or model of the module.</p></li>
<li><p><strong>location</strong> (<em>str</em><em> or </em><em>int</em><em> or </em><em>None</em>) – The location of the module. This is usually the
name or number of the slot on the deck where you
will be placing the module. Some modules, like
the Thermocycler, are only valid in one deck
location. You do not have to specify a location
when loading a Thermocycler - it will always be
in Slot 7.</p></li>
<li><p><strong>configuration</strong> – Used to specify the slot configuration of
the Thermocycler. Only Valid in Python API
Version 2.4 and later. If you wish to use
the non-full plate configuration, you must
pass in the key word value <cite>semi</cite></p></li>
</ul>
</dd>
<dt class="field-even">Returns ModuleContext</dt>
<dd class="field-even"><p>The loaded and initialized
<code class="xref py py-class docutils literal notranslate"><span class="pre">ModuleContext</span></code>.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.loaded_instruments">
<em class="property">property </em><code class="sig-name descname">loaded_instruments</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.loaded_instruments" title="Permalink to this definition">¶</a></dt>
<dd><p>Get the instruments that have been loaded into the protocol.</p>
<p>This is a map of mount name to instruments previously loaded with
<a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_instrument" title="opentrons.protocol_api.contexts.ProtocolContext.load_instrument"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_instrument()</span></code></a>. It is not necessarily the same as the
instruments attached to the robot - for instance, if the robot has
an instrument in both mounts but your protocol has only loaded one
of them with <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_instrument" title="opentrons.protocol_api.contexts.ProtocolContext.load_instrument"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_instrument()</span></code></a>, the unused one will not
be present.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>A dict mapping mount names in lowercase to the instrument
in that mount. If no instrument is loaded in the mount,
it will not be present</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.loaded_labwares">
<em class="property">property </em><code class="sig-name descname">loaded_labwares</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.loaded_labwares" title="Permalink to this definition">¶</a></dt>
<dd><p>Get the labwares that have been loaded into the protocol context.</p>
<p>Slots with nothing in them will not be present in the return value.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>If a module is present on the deck but no labware has been loaded
into it with <code class="xref py py-meth docutils literal notranslate"><span class="pre">ModuleContext.load_labware()</span></code>, there will
be no entry for that slot in this value. That means you should not
use <code class="docutils literal notranslate"><span class="pre">loaded_labwares</span></code> to determine if a slot is available or not,
only to get a list of labwares. If you want a data structure of all
objects on the deck regardless of type, see <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.deck" title="opentrons.protocol_api.contexts.ProtocolContext.deck"><code class="xref py py-attr docutils literal notranslate"><span class="pre">deck</span></code></a>.</p>
</div>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Dict mapping deck slot number to labware, sorted in order of
the locations.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.loaded_modules">
<em class="property">property </em><code class="sig-name descname">loaded_modules</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.loaded_modules" title="Permalink to this definition">¶</a></dt>
<dd><p>Get the modules loaded into the protocol context.</p>
<p>This is a map of deck positions to modules loaded by previous calls
to <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_module" title="opentrons.protocol_api.contexts.ProtocolContext.load_module"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_module()</span></code></a>. It is not necessarily the same as the
modules attached to the robot - for instance, if the robot has a
Magnetic Module and a Temperature Module attached, but the protocol
has only loaded the Temperature Module with <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_module" title="opentrons.protocol_api.contexts.ProtocolContext.load_module"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_module()</span></code></a>,
only the Temperature Module will be present.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns Dict[str, ModuleContext]</dt>
<dd class="field-odd"><p>Dict mapping slot name to module
contexts. The elements may not be
ordered by slot number.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.max_speeds">
<em class="property">property </em><code class="sig-name descname">max_speeds</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.max_speeds" title="Permalink to this definition">¶</a></dt>
<dd><p>Per-axis speed limits when moving this instrument.</p>
<p>Changing this value changes the speed limit for each non-plunger
axis of the robot, when moving this pipette. Note that this does
only sets a limit on how fast movements can be; movements can
still be slower than this. However, it is useful if you require
the robot to move much more slowly than normal when using this
pipette.</p>
<p>This is a dictionary mapping string names of axes to float values
limiting speeds. To change a speed, set that axis’s value. To
reset an axis’s speed to default, delete the entry for that axis
or assign it to <code class="docutils literal notranslate"><span class="pre">None</span></code>.</p>
<p>For instance,</p>
<div class="highlight-py notranslate"><div class="highlight"><pre><span></span><span class="k">def</span> <span class="nf">run</span><span class="p">(</span><span class="n">protocol</span><span class="p">):</span>
    <span class="n">protocol</span><span class="o">.</span><span class="n">comment</span><span class="p">(</span><span class="nb">str</span><span class="p">(</span><span class="n">right</span><span class="o">.</span><span class="n">max_speeds</span><span class="p">))</span>  <span class="c1"># '{}' - all default</span>
    <span class="n">protocol</span><span class="o">.</span><span class="n">max_speeds</span><span class="p">[</span><span class="s1">'A'</span><span class="p">]</span> <span class="o">=</span> <span class="mi">10</span>  <span class="c1"># limit max speed of</span>
                                   <span class="c1"># right pipette Z to 10mm/s</span>
    <span class="k">del</span> <span class="n">protocol</span><span class="o">.</span><span class="n">max_speeds</span><span class="p">[</span><span class="s1">'A'</span><span class="p">]</span>  <span class="c1"># reset to default</span>
    <span class="n">protocol</span><span class="o">.</span><span class="n">max_speeds</span><span class="p">[</span><span class="s1">'X'</span><span class="p">]</span> <span class="o">=</span> <span class="mi">10</span>  <span class="c1"># limit max speed of x to</span>
                                   <span class="c1"># 10 mm/s</span>
    <span class="n">protocol</span><span class="o">.</span><span class="n">max_speeds</span><span class="p">[</span><span class="s1">'X'</span><span class="p">]</span> <span class="o">=</span> <span class="kc">None</span>  <span class="c1"># reset to default</span>
</pre></div>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.pause">
<code class="sig-name descname">pause</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">msg=None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.pause" title="Permalink to this definition">¶</a></dt>
<dd><p>Pause execution of the protocol until resume is called.</p>
<p>This function returns immediately, but the next function call that
is blocked by a paused robot (anything that involves moving) will
not return until <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.resume" title="opentrons.protocol_api.contexts.ProtocolContext.resume"><code class="xref py py-meth docutils literal notranslate"><span class="pre">resume()</span></code></a> is called.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>msg</strong> (<em>str</em>) – A message to echo back to connected clients.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.rail_lights_on">
<em class="property">property </em><code class="sig-name descname">rail_lights_on</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.rail_lights_on" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns True if the rail lights are on</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.5.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.resume">
<code class="sig-name descname">resume</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.resume" title="Permalink to this definition">¶</a></dt>
<dd><p>Resume a previously-paused protocol</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.set_rail_lights">
<code class="sig-name descname">set_rail_lights</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">on: bool</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.set_rail_lights" title="Permalink to this definition">¶</a></dt>
<dd><p>Controls the robot rail lights</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>on</strong> (<em>bool</em>) – If true, turn on rail lights; otherwise, turn off.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.5.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ProtocolContext.temp_connect">
<code class="sig-name descname">temp_connect</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">hardware: opentrons.hardware_control.api.API</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ProtocolContext.temp_connect" title="Permalink to this definition">¶</a></dt>
<dd><p>Connect temporarily to the specified hardware controller.</p>
<p>This should be used as a context manager:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="k">with</span> <span class="n">ctx</span><span class="o">.</span><span class="n">temp_connect</span><span class="p">(</span><span class="n">hw</span><span class="p">):</span>
    <span class="c1"># do some tasks</span>
    <span class="n">ctx</span><span class="o">.</span><span class="n">home</span><span class="p">()</span>
<span class="c1"># after the with block, the context is connected to the same</span>
<span class="c1"># hardware control API it was connected to before, even if</span>
<span class="c1"># an error occurred in the code inside the with block</span>
</pre></div>
</div>
</dd></dl>
</dd></dl>
<dl class="class">
<dt id="opentrons.protocol_api.contexts.InstrumentContext">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.contexts.</code><code class="sig-name descname">InstrumentContext</code><span class="sig-paren">(</span><em class="sig-param">ctx: ProtocolContext</em>, <em class="sig-param">hardware_mgr: HardwareManager</em>, <em class="sig-param">mount: opentrons.types.Mount</em>, <em class="sig-param">log_parent: logging.Logger</em>, <em class="sig-param">at_version: opentrons.protocols.types.APIVersion</em>, <em class="sig-param">tip_racks: List[opentrons.protocol_api.labware.Labware] = None</em>, <em class="sig-param">trash: opentrons.protocol_api.labware.Labware = None</em>, <em class="sig-param">default_speed: float = 400.0</em>, <em class="sig-param">requested_as: str = None</em>, <em class="sig-param">**config_kwargs</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext" title="Permalink to this definition">¶</a></dt>
<dd><p>A context for a specific pipette or instrument.</p>
<p>This can be used to call methods related to pipettes - moves or
aspirates or dispenses, or higher-level methods.</p>
<p>Instances of this class bundle up state and config changes to a
pipette - for instance, changes to flow rates or trash containers.
Action methods (like <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.distribute" title="opentrons.protocol_api.contexts.InstrumentContext.distribute"><code class="xref py py-meth docutils literal notranslate"><span class="pre">distribute()</span></code></a>) are
defined here for convenience.</p>
<p>In general, this class should not be instantiated directly; rather,
instances are returned from <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_instrument" title="opentrons.protocol_api.contexts.ProtocolContext.load_instrument"><code class="xref py py-meth docutils literal notranslate"><span class="pre">ProtocolContext.load_instrument()</span></code></a>.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.air_gap">
<code class="sig-name descname">air_gap</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">volume: float = None</em>, <em class="sig-param">height: float = None</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.air_gap" title="Permalink to this definition">¶</a></dt>
<dd><p>Pull air into the pipette current tip at the current location</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>volume</strong> (<em>float</em>) – The amount in uL to aspirate air into the tube.
(Default will use all remaining volume in tip)</p></li>
<li><p><strong>height</strong> (<em>float</em>) – The number of millimiters to move above the current Well
to air-gap aspirate. (Default: 5mm above current Well)</p></li>
</ul>
</dd>
<dt class="field-even">Raises</dt>
<dd class="field-even"><ul class="simple">
<li><p><strong>NoTipAttachedError</strong> – If no tip is attached to the pipette</p></li>
<li><p><strong>RuntimeError</strong> – If location cache is None.
This should happen if <cite>touch_tip</cite> is called
without first calling a method that takes a
location (eg, <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a>,
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a>)</p></li>
</ul>
</dd>
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance</p>
</dd>
</dl>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>Both <code class="docutils literal notranslate"><span class="pre">volume</span></code> and height are optional, but unlike previous API
versions, if you want to specify only <code class="docutils literal notranslate"><span class="pre">height</span></code> you must do it
as a keyword argument: <code class="docutils literal notranslate"><span class="pre">pipette.air_gap(height=2)</span></code>. If you
call <code class="docutils literal notranslate"><span class="pre">air_gap</span></code> with only one unnamed argument, it will always
be interpreted as a volume.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.api_version" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.aspirate">
<code class="sig-name descname">aspirate</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">volume: float = None</em>, <em class="sig-param">location: Union[opentrons.types.Location</em>, <em class="sig-param">opentrons.protocol_api.labware.Well] = None</em>, <em class="sig-param">rate: float = 1.0</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="Permalink to this definition">¶</a></dt>
<dd><p>Aspirate a volume of liquid (in microliters/uL) using this pipette
from the specified location</p>
<p>If only a volume is passed, the pipette will aspirate
from its current position. If only a location is passed (as in
<code class="docutils literal notranslate"><span class="pre">instr.aspirate(location=wellplate['A1'])</span></code>,
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a> will default to the amount of volume available.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>volume</strong> (<em>int</em><em> or </em><em>float</em>) – The volume to aspirate, in microliters. If not
specified, <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.max_volume" title="opentrons.protocol_api.contexts.InstrumentContext.max_volume"><code class="xref py py-attr docutils literal notranslate"><span class="pre">max_volume</span></code></a>.</p></li>
<li><p><strong>location</strong> – Where to aspirate from. If <cite>location</cite> is a
<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>, the robot will aspirate from
<code class="xref py py-obj docutils literal notranslate"><span class="pre">well_bottom_clearance``</span></code>.aspirate`` mm
above the bottom of the well. If <cite>location</cite> is a
<a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">Location</span></code></a> (i.e. the result of
<a class="reference internal" href="#opentrons.protocol_api.labware.Well.top" title="opentrons.protocol_api.labware.Well.top"><code class="xref py py-meth docutils literal notranslate"><span class="pre">Well.top()</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.labware.Well.bottom" title="opentrons.protocol_api.labware.Well.bottom"><code class="xref py py-meth docutils literal notranslate"><span class="pre">Well.bottom()</span></code></a>), the
robot will aspirate from the exact specified location.
If unspecified, the robot will aspirate from the
current position.</p></li>
<li><p><strong>rate</strong> (<em>float</em>) – The relative plunger speed for this aspirate. During
this aspirate, the speed of the plunger will be
<cite>rate</cite> * <code class="xref py py-attr docutils literal notranslate"><span class="pre">aspirate_speed</span></code>. If not specified,
defaults to 1.0 (speed will not be modified).</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>This instance.</p>
</dd>
</dl>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>If <code class="docutils literal notranslate"><span class="pre">aspirate</span></code> is called with a single argument, it will not try
to guess whether the argument is a volume or location - it is
required to be a volume. If you want to call <code class="docutils literal notranslate"><span class="pre">aspirate</span></code> with only
a location, specify it as a keyword argument:
<code class="docutils literal notranslate"><span class="pre">instr.aspirate(location=wellplate['A1'])</span></code></p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.blow_out">
<code class="sig-name descname">blow_out</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">location: Union[opentrons.types.Location</em>, <em class="sig-param">opentrons.protocol_api.labware.Well] = None</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.blow_out" title="Permalink to this definition">¶</a></dt>
<dd><p>Blow liquid out of the tip.</p>
<p>If <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-attr docutils literal notranslate"><span class="pre">dispense</span></code></a> is used to completely empty a pipette,
usually a small amount of liquid will remain in the tip. This
method moves the plunger past its usual stops to fully remove
any remaining liquid from the tip. Regardless of how much liquid
was in the tip when this function is called, after it is done
the tip will be empty.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>location</strong> (<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> or <a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">Location</span></code></a> or None) – The location to blow out into. If not specified,
defaults to the current location of the pipette</p>
</dd>
<dt class="field-even">Raises</dt>
<dd class="field-even"><p><strong>RuntimeError</strong> – If no location is specified and location cache is
None. This should happen if <cite>blow_out</cite> is called
without first calling a method that takes a
location (eg, <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a>,
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a>)</p>
</dd>
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.channels">
<em class="property">property </em><code class="sig-name descname">channels</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.channels" title="Permalink to this definition">¶</a></dt>
<dd><p>The number of channels on the pipette.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.consolidate">
<code class="sig-name descname">consolidate</code><span class="sig-paren">(</span><em class="sig-param">self, volume: float, source: List[opentrons.protocol_api.labware.Well], dest: opentrons.protocol_api.labware.Well, *args, **kwargs</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.consolidate" title="Permalink to this definition">¶</a></dt>
<dd><p>Move liquid from multiple wells (sources) to a single well(destination)</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>volume</strong> – The amount of volume to consolidate from each source
well.</p></li>
<li><p><strong>source</strong> – List of wells from where liquid will be aspirated.</p></li>
<li><p><strong>dest</strong> – The single well into which liquid will be dispensed.</p></li>
<li><p><strong>kwargs</strong> – See <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.transfer" title="opentrons.protocol_api.contexts.InstrumentContext.transfer"><code class="xref py py-meth docutils literal notranslate"><span class="pre">transfer()</span></code></a>. Some arguments are changed.
Specifically, <code class="docutils literal notranslate"><span class="pre">mix_before</span></code>, if specified, is ignored
and <code class="docutils literal notranslate"><span class="pre">disposal_volume</span></code> is ignored and set to 0.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.current_volume">
<em class="property">property </em><code class="sig-name descname">current_volume</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.current_volume" title="Permalink to this definition">¶</a></dt>
<dd><p>The current amount of liquid, in microliters, held in the pipette.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.default_speed">
<em class="property">property </em><code class="sig-name descname">default_speed</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.default_speed" title="Permalink to this definition">¶</a></dt>
<dd><p>The speed at which the robot’s gantry moves.</p>
<p>By default, 400 mm/s. Changing this value will change the speed of the
pipette when moving between labware. In addition to changing the
default, the speed of individual motions can be changed with the
<code class="docutils literal notranslate"><span class="pre">speed</span></code> argument to <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.move_to" title="opentrons.protocol_api.contexts.InstrumentContext.move_to"><code class="xref py py-meth docutils literal notranslate"><span class="pre">InstrumentContext.move_to()</span></code></a>.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.delay">
<code class="sig-name descname">delay</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.delay" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.dispense">
<code class="sig-name descname">dispense</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">volume: float = None</em>, <em class="sig-param">location: Union[opentrons.types.Location</em>, <em class="sig-param">opentrons.protocol_api.labware.Well] = None</em>, <em class="sig-param">rate: float = 1.0</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="Permalink to this definition">¶</a></dt>
<dd><p>Dispense a volume of liquid (in microliters/uL) using this pipette
into the specified location.</p>
<p>If only a volume is passed, the pipette will dispense from its current
position. If only a location is passed (as in
<code class="docutils literal notranslate"><span class="pre">instr.dispense(location=wellplate['A1'])</span></code>), all of the liquid
aspirated into the pipette will be dispensed (this volume is accessible
through <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.current_volume" title="opentrons.protocol_api.contexts.InstrumentContext.current_volume"><code class="xref py py-attr docutils literal notranslate"><span class="pre">current_volume</span></code></a>).</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>volume</strong> (<em>int</em><em> or </em><em>float</em>) – The volume of liquid to dispense, in microliters. If not
specified, defaults to <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.current_volume" title="opentrons.protocol_api.contexts.InstrumentContext.current_volume"><code class="xref py py-attr docutils literal notranslate"><span class="pre">current_volume</span></code></a>.</p></li>
<li><p><strong>location</strong> – Where to dispense into. If <cite>location</cite> is a
<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>, the robot will dispense into
<code class="xref py py-obj docutils literal notranslate"><span class="pre">well_bottom_clearance``</span></code>.dispense`` mm
above the bottom of the well. If <cite>location</cite> is a
<a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">Location</span></code></a> (i.e. the result of
<a class="reference internal" href="#opentrons.protocol_api.labware.Well.top" title="opentrons.protocol_api.labware.Well.top"><code class="xref py py-meth docutils literal notranslate"><span class="pre">Well.top()</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.labware.Well.bottom" title="opentrons.protocol_api.labware.Well.bottom"><code class="xref py py-meth docutils literal notranslate"><span class="pre">Well.bottom()</span></code></a>), the
robot will dispense into the exact specified location.
If unspecified, the robot will dispense into the
current position.</p></li>
<li><p><strong>rate</strong> (<em>float</em>) – The relative plunger speed for this dispense. During
this dispense, the speed of the plunger will be
<cite>rate</cite> * <code class="xref py py-attr docutils literal notranslate"><span class="pre">dispense_speed</span></code>. If not specified,
defaults to 1.0 (speed will not be modified).</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>This instance.</p>
</dd>
</dl>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>If <code class="docutils literal notranslate"><span class="pre">dispense</span></code> is called with a single argument, it will not try
to guess whether the argument is a volume or location - it is
required to be a volume. If you want to call <code class="docutils literal notranslate"><span class="pre">dispense</span></code> with only
a location, specify it as a keyword argument:
<code class="docutils literal notranslate"><span class="pre">instr.dispense(location=wellplate['A1'])</span></code></p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.distribute">
<code class="sig-name descname">distribute</code><span class="sig-paren">(</span><em class="sig-param">self, volume: float, source: opentrons.protocol_api.labware.Well, dest: List[opentrons.protocol_api.labware.Well], *args, **kwargs</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.distribute" title="Permalink to this definition">¶</a></dt>
<dd><p>Move a volume of liquid from one source to multiple destinations.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>volume</strong> – The amount of volume to distribute to each destination
well.</p></li>
<li><p><strong>source</strong> – A single well from where liquid will be aspirated.</p></li>
<li><p><strong>dest</strong> – List of Wells where liquid will be dispensed to.</p></li>
<li><p><strong>kwargs</strong> – See <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.transfer" title="opentrons.protocol_api.contexts.InstrumentContext.transfer"><code class="xref py py-meth docutils literal notranslate"><span class="pre">transfer()</span></code></a>. Some arguments are changed.
Specifically, <code class="docutils literal notranslate"><span class="pre">mix_after</span></code>, if specified, is ignored
and <code class="docutils literal notranslate"><span class="pre">disposal_volume</span></code>, if not specified, is set to the
minimum volume of the pipette</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.drop_tip">
<code class="sig-name descname">drop_tip</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">location: Union[opentrons.types.Location</em>, <em class="sig-param">opentrons.protocol_api.labware.Well] = None</em>, <em class="sig-param">home_after: bool = True</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.drop_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>Drop the current tip.</p>
<p>If no location is passed, the Pipette will drop the tip into its
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.trash_container" title="opentrons.protocol_api.contexts.InstrumentContext.trash_container"><code class="xref py py-attr docutils literal notranslate"><span class="pre">trash_container</span></code></a>, which if not specified defaults to
the fixed trash in slot 12.</p>
<p>The location in which to drop the tip can be manually specified with
the <cite>location</cite> argument. The <cite>location</cite> argument can be specified in
several ways:</p>
<blockquote>
<div><ul class="simple">
<li><p>If the only thing to specify is which well into which to drop
a tip, <cite>location</cite> can be a <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>. For instance,
if you have a tip rack in a variable called <cite>tiprack</cite>, you can
drop a tip into a specific well on that tiprack with the call
<cite>instr.drop_tip(tiprack.wells()[0])</cite>. This style of call can
be used to make the robot drop a tip into arbitrary labware.</p></li>
<li><p>If the position to drop the tip from as well as the
<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> to drop the tip into needs to be specified,
for instance to tell the robot to drop a tip from an unusually
large height above the tiprack, <cite>location</cite>
can be a <a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.Location</span></code></a>; for instance, you can call
<cite>instr.drop_tip(tiprack.wells()[0].top())</cite>.</p></li>
</ul>
</div></blockquote>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>location</strong> (<a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.Location</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> or
None) – The location to drop the tip</p></li>
<li><p><strong>home_after</strong> – Whether to home the plunger after dropping the tip
(defaults to <code class="docutils literal notranslate"><span class="pre">True</span></code>). The plungeer must home after
dropping tips because the ejector shroud that pops
the tip off the end of the pipette is driven by the
plunger motor, and may skip steps when dropping the
tip.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.flow_rate">
<em class="property">property </em><code class="sig-name descname">flow_rate</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.flow_rate" title="Permalink to this definition">¶</a></dt>
<dd><p>The speeds (in uL/s) configured for the pipette.</p>
<p>This is an object with attributes <code class="docutils literal notranslate"><span class="pre">aspirate</span></code>, <code class="docutils literal notranslate"><span class="pre">dispense</span></code>, and
<code class="docutils literal notranslate"><span class="pre">blow_out</span></code> holding the flow rates for the corresponding operation.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>This property is equivalent to <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.speed" title="opentrons.protocol_api.contexts.InstrumentContext.speed"><code class="xref py py-attr docutils literal notranslate"><span class="pre">speed</span></code></a>; the only
difference is the units in which this property is specified.
specifiying this property uses the units of the volumetric flow rate
of liquid into or out of the tip, while <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.speed" title="opentrons.protocol_api.contexts.InstrumentContext.speed"><code class="xref py py-attr docutils literal notranslate"><span class="pre">speed</span></code></a> uses the
units of the linear speed of the plunger inside the pipette.
Because <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.speed" title="opentrons.protocol_api.contexts.InstrumentContext.speed"><code class="xref py py-attr docutils literal notranslate"><span class="pre">speed</span></code></a> and <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.flow_rate" title="opentrons.protocol_api.contexts.InstrumentContext.flow_rate"><code class="xref py py-attr docutils literal notranslate"><span class="pre">flow_rate</span></code></a> modify the
same values, setting one will override the other.</p>
</div>
<p>For instance, to change the flow rate for aspiration on an instrument
you would do</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">instrument</span><span class="o">.</span><span class="n">flow_rate</span><span class="o">.</span><span class="n">aspirate</span> <span class="o">=</span> <span class="mi">50</span>
</pre></div>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.home">
<code class="sig-name descname">home</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.home" title="Permalink to this definition">¶</a></dt>
<dd><p>Home the robot.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.home_plunger">
<code class="sig-name descname">home_plunger</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.home_plunger" title="Permalink to this definition">¶</a></dt>
<dd><p>Home the plunger associated with this mount</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.hw_pipette">
<em class="property">property </em><code class="sig-name descname">hw_pipette</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.hw_pipette" title="Permalink to this definition">¶</a></dt>
<dd><p>View the information returned by the hardware API directly.</p>
<dl class="field-list simple">
<dt class="field-odd">Raises</dt>
<dd class="field-odd"><p>a <a class="reference internal" href="#opentrons.types.PipetteNotAttachedError" title="opentrons.types.PipetteNotAttachedError"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.PipetteNotAttachedError</span></code></a> if the pipette is
no longer attached (should not happen).</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.max_volume">
<em class="property">property </em><code class="sig-name descname">max_volume</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.max_volume" title="Permalink to this definition">¶</a></dt>
<dd><p>The maximum volume, in microliters, this pipette can hold.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.min_volume">
<em class="property">property </em><code class="sig-name descname">min_volume</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.min_volume" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.mix">
<code class="sig-name descname">mix</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">repetitions: int = 1</em>, <em class="sig-param">volume: float = None</em>, <em class="sig-param">location: Union[opentrons.types.Location</em>, <em class="sig-param">opentrons.protocol_api.labware.Well] = None</em>, <em class="sig-param">rate: float = 1.0</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.mix" title="Permalink to this definition">¶</a></dt>
<dd><p>Mix a volume of liquid (uL) using this pipette.
If no location is specified, the pipette will mix from its current
position. If no volume is passed, <code class="docutils literal notranslate"><span class="pre">mix</span></code> will default to the
pipette’s <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.max_volume" title="opentrons.protocol_api.contexts.InstrumentContext.max_volume"><code class="xref py py-attr docutils literal notranslate"><span class="pre">max_volume</span></code></a>.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>repetitions</strong> – how many times the pipette should mix (default: 1)</p></li>
<li><p><strong>volume</strong> – number of microliters to mix (default:
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.max_volume" title="opentrons.protocol_api.contexts.InstrumentContext.max_volume"><code class="xref py py-attr docutils literal notranslate"><span class="pre">max_volume</span></code></a>)</p></li>
<li><p><strong>location</strong> (<a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><em>types.Location</em></a>) – a Well or a position relative to well.
e.g, <cite>plate.rows()[0][0].bottom()</cite></p></li>
<li><p><strong>rate</strong> – Set plunger speed for this mix, where,
<code class="docutils literal notranslate"><span class="pre">speed</span> <span class="pre">=</span> <span class="pre">rate</span> <span class="pre">*</span> <span class="pre">(aspirate_speed</span> <span class="pre">or</span> <span class="pre">dispense_speed)</span></code></p></li>
</ul>
</dd>
<dt class="field-even">Raises</dt>
<dd class="field-even"><p><strong>NoTipAttachedError</strong> – If no tip is attached to the pipette.</p>
</dd>
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance</p>
</dd>
</dl>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>All the arguments to <code class="docutils literal notranslate"><span class="pre">mix</span></code> are optional; however, if you do
not want to specify one of them, all arguments after that one
should be keyword arguments. For instance, if you do not want
to specify volume, you would call
<code class="docutils literal notranslate"><span class="pre">pipette.mix(1,</span> <span class="pre">location=wellplate['A1'])</span></code>. If you do not
want to specify repetitions, you would call
<code class="docutils literal notranslate"><span class="pre">pipette.mix(volume=10,</span> <span class="pre">location=wellplate['A1'])</span></code>. Unlike
previous API versions, <code class="docutils literal notranslate"><span class="pre">mix</span></code> will not attempt to guess your
inputs; the first argument will always be interpreted as
<code class="docutils literal notranslate"><span class="pre">repetitions</span></code>, the second as <code class="docutils literal notranslate"><span class="pre">volume</span></code>, and the third as
<code class="docutils literal notranslate"><span class="pre">location</span></code> unless you use keywords.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.model">
<em class="property">property </em><code class="sig-name descname">model</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.model" title="Permalink to this definition">¶</a></dt>
<dd><p>The model string for the pipette (e.g. ‘p300_single_v1.3’)</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.mount">
<em class="property">property </em><code class="sig-name descname">mount</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.mount" title="Permalink to this definition">¶</a></dt>
<dd><p>Return the name of the mount this pipette is attached to</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.move_to">
<code class="sig-name descname">move_to</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">location: opentrons.types.Location</em>, <em class="sig-param">force_direct: bool = False</em>, <em class="sig-param">minimum_z_height: float = None</em>, <em class="sig-param">speed: float = None</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.move_to" title="Permalink to this definition">¶</a></dt>
<dd><p>Move the instrument.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>location</strong> (<a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.Location</span></code></a>) – The location to move to.</p></li>
<li><p><strong>force_direct</strong> – If set to true, move directly to destination
without arc motion.</p></li>
<li><p><strong>minimum_z_height</strong> – When specified, this Z margin is able to raise
(but never lower) the mid-arc height.</p></li>
<li><p><strong>speed</strong> – The speed at which to move. By default,
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.default_speed" title="opentrons.protocol_api.contexts.InstrumentContext.default_speed"><code class="xref py py-attr docutils literal notranslate"><span class="pre">InstrumentContext.default_speed</span></code></a>. This controls
the straight linear speed of the motion; to limit
individual axis speeds, you can use
<code class="xref py py-attr docutils literal notranslate"><span class="pre">ProtocolContext.max_speeds</span></code>.</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.name">
<em class="property">property </em><code class="sig-name descname">name</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.name" title="Permalink to this definition">¶</a></dt>
<dd><p>The name string for the pipette (e.g. ‘p300_single’)</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.pick_up_tip">
<code class="sig-name descname">pick_up_tip</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">location: Union[opentrons.types.Location</em>, <em class="sig-param">opentrons.protocol_api.labware.Well] = None</em>, <em class="sig-param">presses: int = None</em>, <em class="sig-param">increment: float = None</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.pick_up_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>Pick up a tip for the pipette to run liquid-handling commands with</p>
<p>If no location is passed, the Pipette will pick up the next available
tip in its <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.tip_racks" title="opentrons.protocol_api.contexts.InstrumentContext.tip_racks"><code class="xref py py-attr docutils literal notranslate"><span class="pre">InstrumentContext.tip_racks</span></code></a> list.</p>
<p>The tip to pick up can be manually specified with the <cite>location</cite>
argument. The <cite>location</cite> argument can be specified in several ways:</p>
<ul class="simple">
<li><p>If the only thing to specify is which well from which to pick
up a tip, <cite>location</cite> can be a <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>. For instance,
if you have a tip rack in a variable called <cite>tiprack</cite>, you can
pick up a specific tip from it with
<code class="docutils literal notranslate"><span class="pre">instr.pick_up_tip(tiprack.wells()[0])</span></code>. This style of call can
be used to make the robot pick up a tip from a tip rack that
was not specified when creating the <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext" title="opentrons.protocol_api.contexts.InstrumentContext"><code class="xref py py-class docutils literal notranslate"><span class="pre">InstrumentContext</span></code></a>.</p></li>
<li><p>If the position to move to in the well needs to be specified,
for instance to tell the robot to run its pick up tip routine
starting closer to or farther from the top of the tip,
<cite>location</cite> can be a <a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.Location</span></code></a>; for instance,
you can call <code class="docutils literal notranslate"><span class="pre">instr.pick_up_tip(tiprack.wells()[0].top())</span></code>.</p></li>
</ul>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>location</strong> (<a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">types.Location</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> to
pick up a tip from.) – The location from which to pick up a tip.</p></li>
<li><p><strong>presses</strong> (<em>int</em>) – The number of times to lower and then raise the pipette
when picking up a tip, to ensure a good seal (0 [zero]
will result in the pipette hovering over the tip but
not picking it up–generally not desireable, but could
be used for dry-run).</p></li>
<li><p><strong>increment</strong> (<em>float</em>) – The additional distance to travel on each successive
press (e.g.: if <cite>presses=3</cite> and <cite>increment=1.0</cite>, then
the first press will travel down into the tip by
3.5mm, the second by 4.5mm, and the third by 5.5mm).</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.reset_tipracks">
<code class="sig-name descname">reset_tipracks</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.reset_tipracks" title="Permalink to this definition">¶</a></dt>
<dd><p>Reload all tips in each tip rack and reset starting tip</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.return_height">
<em class="property">property </em><code class="sig-name descname">return_height</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.return_height" title="Permalink to this definition">¶</a></dt>
<dd><p>The height to return a tip to its tiprack.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.2.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.return_tip">
<code class="sig-name descname">return_tip</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">home_after: bool = True</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.return_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>If a tip is currently attached to the pipette, then it will return the
tip to it’s location in the tiprack.</p>
<p>It will not reset tip tracking so the well flag will remain False.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.speed">
<em class="property">property </em><code class="sig-name descname">speed</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.speed" title="Permalink to this definition">¶</a></dt>
<dd><p>The speeds (in mm/s) configured for the pipette plunger.</p>
<p>This is an object with attributes <code class="docutils literal notranslate"><span class="pre">aspirate</span></code>, <code class="docutils literal notranslate"><span class="pre">dispense</span></code>, and
<code class="docutils literal notranslate"><span class="pre">blow_out</span></code> holding the plunger speeds for the corresponding
operation.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>This property is equivalent to <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.flow_rate" title="opentrons.protocol_api.contexts.InstrumentContext.flow_rate"><code class="xref py py-attr docutils literal notranslate"><span class="pre">flow_rate</span></code></a>; the only
difference is the units in which this property is specified.
Specifying this attribute uses the units of the linear speed of
the plunger inside the pipette, while <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.flow_rate" title="opentrons.protocol_api.contexts.InstrumentContext.flow_rate"><code class="xref py py-attr docutils literal notranslate"><span class="pre">flow_rate</span></code></a> uses
the units of the volumetric flow rate of liquid into or out of the
tip. Because <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.speed" title="opentrons.protocol_api.contexts.InstrumentContext.speed"><code class="xref py py-attr docutils literal notranslate"><span class="pre">speed</span></code></a> and <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.flow_rate" title="opentrons.protocol_api.contexts.InstrumentContext.flow_rate"><code class="xref py py-attr docutils literal notranslate"><span class="pre">flow_rate</span></code></a> modify the
same values, setting one will override the other.</p>
</div>
<p>For instance, to set the plunger speed during an aspirate action, do</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">instrument</span><span class="o">.</span><span class="n">speed</span><span class="o">.</span><span class="n">aspirate</span> <span class="o">=</span> <span class="mi">50</span>
</pre></div>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.starting_tip">
<em class="property">property </em><code class="sig-name descname">starting_tip</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.starting_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>The starting tip from which the pipette pick up</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.tip_racks">
<em class="property">property </em><code class="sig-name descname">tip_racks</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.tip_racks" title="Permalink to this definition">¶</a></dt>
<dd><p>The tip racks that have been linked to this pipette.</p>
<p>This is the property used to determine which tips to pick up next when
calling <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.pick_up_tip" title="opentrons.protocol_api.contexts.InstrumentContext.pick_up_tip"><code class="xref py py-meth docutils literal notranslate"><span class="pre">pick_up_tip()</span></code></a> without arguments.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.touch_tip">
<code class="sig-name descname">touch_tip</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">location: opentrons.protocol_api.labware.Well = None</em>, <em class="sig-param">radius: float = 1.0</em>, <em class="sig-param">v_offset: float = -1.0</em>, <em class="sig-param">speed: float = 60.0</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.touch_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>Touch the pipette tip to the sides of a well, with the intent of
removing left-over droplets</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>location</strong> (<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> or None) – If no location is passed, pipette will
touch tip at current well’s edges</p></li>
<li><p><strong>radius</strong> (<em>float</em>) – Describes the proportion of the target well’s
radius. When <cite>radius=1.0</cite>, the pipette tip will move to
the edge of the target well; when <cite>radius=0.5</cite>, it will
move to 50% of the well’s radius. Default: 1.0 (100%)</p></li>
<li><p><strong>v_offset</strong> (<em>float</em>) – The offset in mm from the top of the well to touch tip
A positive offset moves the tip higher above the well,
while a negative offset moves it lower into the well
Default: -1.0 mm</p></li>
<li><p><strong>speed</strong> (<em>float</em>) – The speed for touch tip motion, in mm/s.
Default: 60.0 mm/s, Max: 80.0 mm/s, Min: 20.0 mm/s</p></li>
</ul>
</dd>
<dt class="field-even">Raises</dt>
<dd class="field-even"><ul class="simple">
<li><p><strong>NoTipAttachedError</strong> – if no tip is attached to the pipette</p></li>
<li><p><strong>RuntimeError</strong> – If no location is specified and location cache is
None. This should happen if <cite>touch_tip</cite> is called
without first calling a method that takes a
location (eg, <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a>,
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a>)</p></li>
</ul>
</dd>
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance</p>
</dd>
</dl>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>This is behavior change from legacy API (which accepts any
<code class="xref py py-class docutils literal notranslate"><span class="pre">Placeable</span></code> as the <code class="docutils literal notranslate"><span class="pre">location</span></code> parameter)</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.transfer">
<code class="sig-name descname">transfer</code><span class="sig-paren">(</span><em class="sig-param">self, volume: Union[float, Sequence[float]], source: Union[opentrons.protocol_api.labware.Well, opentrons.types.Location, List[Union[opentrons.protocol_api.labware.Well, opentrons.types.Location]], List[List[opentrons.protocol_api.labware.Well]]], dest: Union[opentrons.protocol_api.labware.Well, opentrons.types.Location, List[Union[opentrons.protocol_api.labware.Well, opentrons.types.Location]], List[List[opentrons.protocol_api.labware.Well]]], trash=True, **kwargs</em><span class="sig-paren">)</span> → 'InstrumentContext'<a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.transfer" title="Permalink to this definition">¶</a></dt>
<dd><p>Transfer will move a volume of liquid from a source location(s)
to a dest location(s). It is a higher-level command, incorporating
other <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext" title="opentrons.protocol_api.contexts.InstrumentContext"><code class="xref py py-class docutils literal notranslate"><span class="pre">InstrumentContext</span></code></a> commands, like <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a>
and <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a>, designed to make protocol writing easier at
the cost of specificity.</p>
<dl class="field-list">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>volume</strong> – The amount of volume to aspirate from each source and
dispense to each destination.
If volume is a list, each volume will be used for the
sources/targets at the matching index. If volumes is a
tuple with two elements, like <cite>(20, 100)</cite>, then a list
of volumes will be generated with a linear gradient
between the two volumes in the tuple.</p></li>
<li><p><strong>source</strong> – A single well or a list of wells from where liquid
will be aspirated.</p></li>
<li><p><strong>dest</strong> – A single well or a list of wells where liquid
will be dispensed to.</p></li>
<li><p><strong>**kwargs</strong> – See below</p></li>
</ul>
</dd>
<dt class="field-even">Keyword Arguments</dt>
<dd class="field-even"><ul>
<li><p><em>new_tip</em> (<code class="docutils literal notranslate"><span class="pre">string</span></code>) –</p>
<blockquote>
<div><ul class="simple">
<li><p>‘never’: no tips will be picked up or dropped during transfer</p></li>
<li><p>‘once’: (default) a single tip will be used for all commands.</p></li>
<li><p>‘always’: use a new tip for each transfer.</p></li>
</ul>
</div></blockquote>
</li>
<li><p><em>trash</em> (<code class="docutils literal notranslate"><span class="pre">boolean</span></code>) –
If <cite>True</cite> (default behavior), tips will be
dropped in the trash container attached this <cite>Pipette</cite>.
If <cite>False</cite> tips will be returned to tiprack.</p></li>
<li><p><em>touch_tip</em> (<code class="docutils literal notranslate"><span class="pre">boolean</span></code>) –
If <cite>True</cite>, a <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.touch_tip" title="opentrons.protocol_api.contexts.InstrumentContext.touch_tip"><code class="xref py py-meth docutils literal notranslate"><span class="pre">touch_tip()</span></code></a> will occur following each
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a> and <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a>. If set to <cite>False</cite>
(default behavior), no <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.touch_tip" title="opentrons.protocol_api.contexts.InstrumentContext.touch_tip"><code class="xref py py-meth docutils literal notranslate"><span class="pre">touch_tip()</span></code></a> will occur.</p></li>
<li><p><em>blow_out</em> (<code class="docutils literal notranslate"><span class="pre">boolean</span></code>) –
If <cite>True</cite>, a <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.blow_out" title="opentrons.protocol_api.contexts.InstrumentContext.blow_out"><code class="xref py py-meth docutils literal notranslate"><span class="pre">blow_out()</span></code></a> will occur following each
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a>, but only if the pipette has no liquid left
in it. If set to <cite>False</cite> (default), no <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.blow_out" title="opentrons.protocol_api.contexts.InstrumentContext.blow_out"><code class="xref py py-meth docutils literal notranslate"><span class="pre">blow_out()</span></code></a> will
occur.</p></li>
<li><p><em>mix_before</em> (<code class="docutils literal notranslate"><span class="pre">tuple</span></code>) –
The tuple, if specified, gives the amount of volume to
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.mix" title="opentrons.protocol_api.contexts.InstrumentContext.mix"><code class="xref py py-meth docutils literal notranslate"><span class="pre">mix()</span></code></a> preceding each <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a> during the
transfer. The tuple is interpreted as (repetitions, volume).</p></li>
<li><p><em>mix_after</em> (<code class="docutils literal notranslate"><span class="pre">tuple</span></code>) –
The tuple, if specified, gives the amount of volume to
<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.mix" title="opentrons.protocol_api.contexts.InstrumentContext.mix"><code class="xref py py-meth docutils literal notranslate"><span class="pre">mix()</span></code></a> after each <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a> during the
transfer. The tuple is interpreted as (repetitions, volume).</p></li>
<li><p><em>disposal_volume</em> (<code class="docutils literal notranslate"><span class="pre">float</span></code>) –
(<a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.distribute" title="opentrons.protocol_api.contexts.InstrumentContext.distribute"><code class="xref py py-meth docutils literal notranslate"><span class="pre">distribute()</span></code></a> only) Volume of liquid to be disposed off
after distributing. When dispensing multiple times from the same
tip, it is recommended to aspirate an extra amount of liquid to
be disposed off after distributing.</p></li>
<li><p><em>carryover</em> (<code class="docutils literal notranslate"><span class="pre">boolean</span></code>) –
If <cite>True</cite> (default), any <cite>volume</cite> that exceeds the maximum volume
of this Pipette will be split into multiple smaller volumes.</p></li>
<li><p><em>gradient</em> (<code class="docutils literal notranslate"><span class="pre">lambda</span></code>) –
Function for calculating the curve used for gradient volumes.
When <cite>volume</cite> is a tuple of length 2, its values are used to
create a list of gradient volumes. The default curve for this
gradient is linear (lambda x: x), however a method can be passed
with the <cite>gradient</cite> keyword argument to create a custom curve.</p></li>
</ul>
</dd>
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>This instance</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.trash_container">
<em class="property">property </em><code class="sig-name descname">trash_container</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.trash_container" title="Permalink to this definition">¶</a></dt>
<dd><p>The trash container associated with this pipette.</p>
<p>This is the property used to determine where to drop tips and blow out
liquids when calling <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.drop_tip" title="opentrons.protocol_api.contexts.InstrumentContext.drop_tip"><code class="xref py py-meth docutils literal notranslate"><span class="pre">drop_tip()</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.blow_out" title="opentrons.protocol_api.contexts.InstrumentContext.blow_out"><code class="xref py py-meth docutils literal notranslate"><span class="pre">blow_out()</span></code></a> without
arguments.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.type">
<em class="property">property </em><code class="sig-name descname">type</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.type" title="Permalink to this definition">¶</a></dt>
<dd><p>One of <cite>‘single’</cite> or <cite>‘multi’</cite>.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.InstrumentContext.well_bottom_clearance">
<em class="property">property </em><code class="sig-name descname">well_bottom_clearance</code><a class="headerlink" href="#opentrons.protocol_api.contexts.InstrumentContext.well_bottom_clearance" title="Permalink to this definition">¶</a></dt>
<dd><p>The distance above the bottom of a well to aspirate or dispense.</p>
<p>This is an object with attributes <code class="docutils literal notranslate"><span class="pre">aspirate</span></code> and <code class="docutils literal notranslate"><span class="pre">dispense</span></code>,
describing the default heights of the corresponding operation. The
default is 1.0mm for both aspirate and dispense.</p>
<p>When <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.aspirate" title="opentrons.protocol_api.contexts.InstrumentContext.aspirate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">aspirate()</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.dispense" title="opentrons.protocol_api.contexts.InstrumentContext.dispense"><code class="xref py py-meth docutils literal notranslate"><span class="pre">dispense()</span></code></a> is given a
<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> rather than a full <a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">Location</span></code></a>, the robot
will move this distance above the bottom of the well to aspirate or
dispense.</p>
<p>To change, set the corresponding attribute. For instance,</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">instr</span><span class="o">.</span><span class="n">well_bottom_clearance</span><span class="o">.</span><span class="n">aspirate</span> <span class="o">=</span> <span class="mi">1</span>
</pre></div>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
</dd></dl>


<span id="labware-and-wells"></span><span id="protocol-api-labware"></span><h2 id="module-opentrons.protocol_api.labware">Labware and Wells<a class="headerlink" href="#module-opentrons.protocol_api.labware" title="Permalink to this headline">¶</a></h2>
<p>opentrons.protocol_api.labware: classes and functions for labware handling</p>
<p>This module provides things like <a class="reference internal" href="#opentrons.protocol_api.labware.Labware" title="opentrons.protocol_api.labware.Labware"><code class="xref py py-class docutils literal notranslate"><span class="pre">Labware</span></code></a>, and <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>
to encapsulate labware instances used in protocols
and their wells. It also provides helper functions to load and save labware
and labware calibration offsets. It contains all the code necessary to
transform from labware symbolic points (such as “well a1 of an opentrons
tiprack”) to points in deck coordinates.</p>
<dl class="class">
<dt id="opentrons.protocol_api.labware.Labware">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">Labware</code><span class="sig-paren">(</span><em class="sig-param">definition: LabwareDefinition</em>, <em class="sig-param">parent: opentrons.types.Location</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">api_level: opentrons.protocols.types.APIVersion = None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.labware.Labware" title="Permalink to this definition">¶</a></dt>
<dd><p>This class represents a labware, such as a PCR plate, a tube rack,
reservoir, tip rack, etc. It defines the physical geometry of the labware,
and provides methods for accessing wells within the labware.</p>
<p>It is commonly created by calling <code class="xref py py-meth docutils literal notranslate"><span class="pre">ProtocolContext.load_labware()</span></code>.</p>
<p>To access a labware’s wells, you can use its well accessor methods:
<a class="reference internal" href="#opentrons.protocol_api.labware.Labware.wells_by_name" title="opentrons.protocol_api.labware.Labware.wells_by_name"><code class="xref py py-meth docutils literal notranslate"><span class="pre">wells_by_name()</span></code></a>, <a class="reference internal" href="#opentrons.protocol_api.labware.Labware.wells" title="opentrons.protocol_api.labware.Labware.wells"><code class="xref py py-meth docutils literal notranslate"><span class="pre">wells()</span></code></a>, <a class="reference internal" href="#opentrons.protocol_api.labware.Labware.columns" title="opentrons.protocol_api.labware.Labware.columns"><code class="xref py py-meth docutils literal notranslate"><span class="pre">columns()</span></code></a>,
<a class="reference internal" href="#opentrons.protocol_api.labware.Labware.rows" title="opentrons.protocol_api.labware.Labware.rows"><code class="xref py py-meth docutils literal notranslate"><span class="pre">rows()</span></code></a>, <a class="reference internal" href="#opentrons.protocol_api.labware.Labware.rows_by_name" title="opentrons.protocol_api.labware.Labware.rows_by_name"><code class="xref py py-meth docutils literal notranslate"><span class="pre">rows_by_name()</span></code></a>, and <a class="reference internal" href="#opentrons.protocol_api.labware.Labware.columns_by_name" title="opentrons.protocol_api.labware.Labware.columns_by_name"><code class="xref py py-meth docutils literal notranslate"><span class="pre">columns_by_name()</span></code></a>.
You can also use an instance of a labware as a Python dictionary, accessing
wells by their names. The following example shows how to use all of these
methods to access well A1:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">labware</span> <span class="o">=</span> <span class="n">context</span><span class="o">.</span><span class="n">load_labware</span><span class="p">(</span><span class="s1">'corning_96_wellplate_360ul_flat'</span><span class="p">,</span> <span class="mi">1</span><span class="p">)</span>
<span class="n">labware</span><span class="p">[</span><span class="s1">'A1'</span><span class="p">]</span>
<span class="n">labware</span><span class="o">.</span><span class="n">wells_by_name</span><span class="p">()[</span><span class="s1">'A1'</span><span class="p">]</span>
<span class="n">labware</span><span class="o">.</span><span class="n">wells</span><span class="p">()[</span><span class="mi">0</span><span class="p">]</span>
<span class="n">labware</span><span class="o">.</span><span class="n">rows</span><span class="p">()[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span>
<span class="n">labware</span><span class="o">.</span><span class="n">columns</span><span class="p">()[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span>
<span class="n">labware</span><span class="o">.</span><span class="n">rows_by_name</span><span class="p">()[</span><span class="s1">'A'</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span>
<span class="n">labware</span><span class="o">.</span><span class="n">columns_by_name</span><span class="p">()[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span>
</pre></div>
</div>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.api_version" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.calibrated_offset">
<em class="property">property </em><code class="sig-name descname">calibrated_offset</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.calibrated_offset" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.columns">
<code class="sig-name descname">columns</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">*args</em><span class="sig-paren">)</span> → List[List[opentrons.protocol_api.labware.Well]]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.columns" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor function used to navigate through a labware by column.</p>
<p>With indexing one can treat it as a typical python nested list.
To access row A for example,
simply write: labware.columns()[0]
This will output [‘A1’, ‘B1’, ‘C1’, ‘D1’…].</p>
<p>Note that this method takes args for backward-compatibility, but use
of args is deprecated and will be removed in future versions. Args
can be either strings or integers, but must all be the same type (e.g.:
<cite>self.columns(1, 4, 8)</cite> or <cite>self.columns(‘1’, ‘2’)</cite>, but
<cite>self.columns(‘1’, 4)</cite> is invalid.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>A list of column lists</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.columns_by_index">
<code class="sig-name descname">columns_by_index</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → Dict[str, List[opentrons.protocol_api.labware.Well]]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.columns_by_index" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.columns_by_name">
<code class="sig-name descname">columns_by_name</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → Dict[str, List[opentrons.protocol_api.labware.Well]]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.columns_by_name" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor function used to navigate through a labware by column name.</p>
<p>With indexing one can treat it as a typical python dictionary.
To access row A for example,
simply write: labware.columns_by_name()[‘1’]
This will output [‘A1’, ‘B1’, ‘C1’, ‘D1’…].</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Dictionary of Well lists keyed by column name</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.highest_z">
<em class="property">property </em><code class="sig-name descname">highest_z</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.highest_z" title="Permalink to this definition">¶</a></dt>
<dd><p>The z-coordinate of the tallest single point anywhere on the labware.</p>
<p>This is drawn from the ‘dimensions’/’zDimension’ elements of the
labware definition and takes into account the calibration offset.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.is_tiprack">
<em class="property">property </em><code class="sig-name descname">is_tiprack</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.is_tiprack" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.load_name">
<em class="property">property </em><code class="sig-name descname">load_name</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.load_name" title="Permalink to this definition">¶</a></dt>
<dd><p>The API load name of the labware definition</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.magdeck_engage_height">
<em class="property">property </em><code class="sig-name descname">magdeck_engage_height</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.magdeck_engage_height" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.name">
<em class="property">property </em><code class="sig-name descname">name</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.name" title="Permalink to this definition">¶</a></dt>
<dd><p>Can either be the canonical name of the labware, which is used to
load it, or the label of the labware specified by a user.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.next_tip">
<code class="sig-name descname">next_tip</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">num_tips: int = 1</em>, <em class="sig-param">starting_tip: opentrons.protocol_api.labware.Well = None</em><span class="sig-paren">)</span> → Union[opentrons.protocol_api.labware.Well, NoneType]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.next_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>Find the next valid well for pick-up.</p>
<p>Determines the next valid start tip from which to retrieve the
specified number of tips. There must be at least <cite>num_tips</cite> sequential
wells for which all wells have tips, in the same column.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>num_tips</strong> (<em>int</em>) – target number of sequential tips in the same column</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>the <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> meeting the target criteria, or None</p>
</dd>
</dl>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.parameters">
<em class="property">property </em><code class="sig-name descname">parameters</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.parameters" title="Permalink to this definition">¶</a></dt>
<dd><p>Internal properties of a labware including type and quirks</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.parent">
<em class="property">property </em><code class="sig-name descname">parent</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.parent" title="Permalink to this definition">¶</a></dt>
<dd><p>The parent of this labware. Usually a slot name.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.previous_tip">
<code class="sig-name descname">previous_tip</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">num_tips: int = 1</em><span class="sig-paren">)</span> → Union[opentrons.protocol_api.labware.Well, NoneType]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.previous_tip" title="Permalink to this definition">¶</a></dt>
<dd><p>Find the best well to drop a tip in.</p>
<p>This is the well from which the last tip was picked up, if there’s
room. It can be used to return tips to the tip tracker.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>num_tips</strong> (<em>int</em>) – target number of tips to return, sequential in a
column</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> meeting the target criteria, or <code class="docutils literal notranslate"><span class="pre">None</span></code></p>
</dd>
</dl>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.quirks">
<em class="property">property </em><code class="sig-name descname">quirks</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.quirks" title="Permalink to this definition">¶</a></dt>
<dd><p>Quirks specific to this labware.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.reset">
<code class="sig-name descname">reset</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.reset" title="Permalink to this definition">¶</a></dt>
<dd><p>Reset all tips in a tiprack</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.return_tips">
<code class="sig-name descname">return_tips</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">start_well: opentrons.protocol_api.labware.Well</em>, <em class="sig-param">num_channels: int = 1</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.return_tips" title="Permalink to this definition">¶</a></dt>
<dd><p>Re-adds tips to the tip tracker</p>
<p>This method should be called when a tip is dropped in a tiprack. It
should be called with <code class="docutils literal notranslate"><span class="pre">num_channels=1</span></code> or <code class="docutils literal notranslate"><span class="pre">num_channels=8</span></code> for
single- and multi-channel respectively. If returning more than one
channel, this method will automatically determine which tips are
returned based on the start well, the number of channels,
and the tiprack geometry.</p>
<p>Note that unlike <a class="reference internal" href="#opentrons.protocol_api.labware.Labware.use_tips" title="opentrons.protocol_api.labware.Labware.use_tips"><code class="xref py py-meth docutils literal notranslate"><span class="pre">use_tips()</span></code></a>, calling this method in a way
that would drop tips into wells with tips in them will raise an
exception; this should only be called on a valid return of
<a class="reference internal" href="#opentrons.protocol_api.labware.Labware.previous_tip" title="opentrons.protocol_api.labware.Labware.previous_tip"><code class="xref py py-meth docutils literal notranslate"><span class="pre">previous_tip()</span></code></a>.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>start_well</strong> (<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>) – The <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> into which to return a tip.</p></li>
<li><p><strong>num_channels</strong> (<em>int</em>) – The number of channels for the current pipette</p></li>
</ul>
</dd>
</dl>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.rows">
<code class="sig-name descname">rows</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">*args</em><span class="sig-paren">)</span> → List[List[opentrons.protocol_api.labware.Well]]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.rows" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor function used to navigate through a labware by row.</p>
<p>With indexing one can treat it as a typical python nested list.
To access row A for example, simply write: labware.rows()[0]. This
will output [‘A1’, ‘A2’, ‘A3’, ‘A4’…]</p>
<p>Note that this method takes args for backward-compatibility, but use
of args is deprecated and will be removed in future versions. Args
can be either strings or integers, but must all be the same type (e.g.:
<cite>self.rows(1, 4, 8)</cite> or <cite>self.rows(‘A’, ‘B’)</cite>, but  <cite>self.rows(‘A’, 4)</cite>
is invalid.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>A list of row lists</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.rows_by_index">
<code class="sig-name descname">rows_by_index</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → Dict[str, List[opentrons.protocol_api.labware.Well]]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.rows_by_index" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.rows_by_name">
<code class="sig-name descname">rows_by_name</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → Dict[str, List[opentrons.protocol_api.labware.Well]]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.rows_by_name" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor function used to navigate through a labware by row name.</p>
<p>With indexing one can treat it as a typical python dictionary.
To access row A for example, simply write: labware.rows_by_name()[‘A’]
This will output [‘A1’, ‘A2’, ‘A3’, ‘A4’…].</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Dictionary of Well lists keyed by row name</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.set_calibration">
<code class="sig-name descname">set_calibration</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">delta: opentrons.types.Point</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.set_calibration" title="Permalink to this definition">¶</a></dt>
<dd><p>Called by save calibration in order to update the offset on the object.</p>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.tip_length">
<em class="property">property </em><code class="sig-name descname">tip_length</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.tip_length" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.uri">
<em class="property">property </em><code class="sig-name descname">uri</code><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.uri" title="Permalink to this definition">¶</a></dt>
<dd><p>A string fully identifying the labware.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>The uri, <code class="docutils literal notranslate"><span class="pre">"namespace/loadname/version"</span></code></p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.use_tips">
<code class="sig-name descname">use_tips</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">start_well: opentrons.protocol_api.labware.Well</em>, <em class="sig-param">num_channels: int = 1</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.labware.Labware.use_tips" title="Permalink to this definition">¶</a></dt>
<dd><p>Removes tips from the tip tracker.</p>
<p>This method should be called when a tip is picked up. Generally, it
will be called with <cite>num_channels=1</cite> or <cite>num_channels=8</cite> for single-
and multi-channel respectively. If picking up with more than one
channel, this method will automatically determine which tips are used
based on the start well, the number of channels, and the geometry of
the tiprack.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>start_well</strong> (<a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a>) – The <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> from which to pick up a tip.
For a single-channel pipette, this is the well to
send the pipette to. For a multi-channel pipette,
this is the well to send the back-most nozzle of the
pipette to.</p></li>
<li><p><strong>num_channels</strong> (<em>int</em>) – The number of channels for the current pipette</p></li>
</ul>
</dd>
</dl>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.well">
<code class="sig-name descname">well</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">idx</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Well<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.well" title="Permalink to this definition">¶</a></dt>
<dd><p>Deprecated—use result of <cite>wells</cite> or <cite>wells_by_name</cite></p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.wells">
<code class="sig-name descname">wells</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">*args</em><span class="sig-paren">)</span> → List[opentrons.protocol_api.labware.Well]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.wells" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor function used to generate a list of wells in top -&gt; down,
left -&gt; right order. This is representative of moving down <cite>rows</cite> and
across <cite>columns</cite> (e.g. ‘A1’, ‘B1’, ‘C1’…’A2’, ‘B2’, ‘C2’)</p>
<p>With indexing one can treat it as a typical python
list. To access well A1, for example, simply write: labware.wells()[0]</p>
<p>Note that this method takes args for backward-compatibility, but use
of args is deprecated and will be removed in future versions. Args
can be either strings or integers, but must all be the same type (e.g.:
<cite>self.wells(1, 4, 8)</cite> or <cite>self.wells(‘A1’, ‘B2’)</cite>, but
<cite>self.wells(‘A1’, 4)</cite> is invalid.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Ordered list of all wells in a labware</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.wells_by_index">
<code class="sig-name descname">wells_by_index</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → Dict[str, opentrons.protocol_api.labware.Well]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.wells_by_index" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Labware.wells_by_name">
<code class="sig-name descname">wells_by_name</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → Dict[str, opentrons.protocol_api.labware.Well]<a class="headerlink" href="#opentrons.protocol_api.labware.Labware.wells_by_name" title="Permalink to this definition">¶</a></dt>
<dd><p>Accessor function used to create a look-up table of Wells by name.</p>
<p>With indexing one can treat it as a typical python
dictionary whose keys are well names. To access well A1, for example,
simply write: labware.wells_by_name()[‘A1’]</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Dictionary of well objects keyed by well name</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
</dd></dl>
<dl class="exception">
<dt id="opentrons.protocol_api.labware.OutOfTipsError">
<em class="property">exception </em><code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">OutOfTipsError</code><a class="headerlink" href="#opentrons.protocol_api.labware.OutOfTipsError" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>
<dl class="class">
<dt id="opentrons.protocol_api.labware.Well">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">Well</code><span class="sig-paren">(</span><em class="sig-param">well_props: WellDefinition</em>, <em class="sig-param">parent: opentrons.types.Location</em>, <em class="sig-param">display_name: str</em>, <em class="sig-param">has_tip: bool</em>, <em class="sig-param">api_level: opentrons.protocols.types.APIVersion</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.labware.Well" title="Permalink to this definition">¶</a></dt>
<dd><p>The Well class represents a  single well in a <a class="reference internal" href="#opentrons.protocol_api.labware.Labware" title="opentrons.protocol_api.labware.Labware"><code class="xref py py-class docutils literal notranslate"><span class="pre">Labware</span></code></a></p>
<p>It provides functions to return positions used in operations on the well
such as <a class="reference internal" href="#opentrons.protocol_api.labware.Well.top" title="opentrons.protocol_api.labware.Well.top"><code class="xref py py-meth docutils literal notranslate"><span class="pre">top()</span></code></a>, <a class="reference internal" href="#opentrons.protocol_api.labware.Well.bottom" title="opentrons.protocol_api.labware.Well.bottom"><code class="xref py py-meth docutils literal notranslate"><span class="pre">bottom()</span></code></a></p>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.labware.Well.api_version" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.bottom">
<code class="sig-name descname">bottom</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">z: float = 0.0</em><span class="sig-paren">)</span> → opentrons.types.Location<a class="headerlink" href="#opentrons.protocol_api.labware.Well.bottom" title="Permalink to this definition">¶</a></dt>
<dd><dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>z</strong> – the z distance in mm</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>a Point corresponding to the absolute position of the
bottom-center of the well (with the front-left corner of
slot 1 as (0,0,0)). If z is specified, returns a point
offset by z mm from bottom-center</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.center">
<code class="sig-name descname">center</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span> → opentrons.types.Location<a class="headerlink" href="#opentrons.protocol_api.labware.Well.center" title="Permalink to this definition">¶</a></dt>
<dd><dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>a Point corresponding to the absolute position of the center
of the well relative to the deck (with the front-left corner
of slot 1 as (0,0,0))</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.diameter">
<em class="property">property </em><code class="sig-name descname">diameter</code><a class="headerlink" href="#opentrons.protocol_api.labware.Well.diameter" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.has_tip">
<em class="property">property </em><code class="sig-name descname">has_tip</code><a class="headerlink" href="#opentrons.protocol_api.labware.Well.has_tip" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.parent">
<em class="property">property </em><code class="sig-name descname">parent</code><a class="headerlink" href="#opentrons.protocol_api.labware.Well.parent" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.labware.Well.top">
<code class="sig-name descname">top</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">z: float = 0.0</em><span class="sig-paren">)</span> → opentrons.types.Location<a class="headerlink" href="#opentrons.protocol_api.labware.Well.top" title="Permalink to this definition">¶</a></dt>
<dd><dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>z</strong> – the z distance in mm</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>a Point corresponding to the absolute position of the
top-center of the well relative to the deck (with the
front-left corner of slot 1 as (0,0,0)). If z is specified,
returns a point offset by z mm from top-center</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.get_all_labware_definitions">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">get_all_labware_definitions</code><span class="sig-paren">(</span><span class="sig-paren">)</span> → List[str]<a class="headerlink" href="#opentrons.protocol_api.labware.get_all_labware_definitions" title="Permalink to this definition">¶</a></dt>
<dd><dl class="simple">
<dt>Return a list of standard and custom labware definitions with load_name +</dt><dd><p>name_space + version existing on the robot</p>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.get_labware_definition">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">get_labware_definition</code><span class="sig-paren">(</span><em class="sig-param">load_name: str</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = None</em>, <em class="sig-param">bundled_defs: Dict[str</em>, <em class="sig-param">ForwardRef('LabwareDefinition')] = None</em>, <em class="sig-param">extra_defs: Dict[str</em>, <em class="sig-param">ForwardRef('LabwareDefinition')] = None</em><span class="sig-paren">)</span> → 'LabwareDefinition'<a class="headerlink" href="#opentrons.protocol_api.labware.get_labware_definition" title="Permalink to this definition">¶</a></dt>
<dd><dl class="simple">
<dt>Look up and return a definition by load_name + namespace + version and</dt><dd><p>return it or raise an exception</p>
</dd>
</dl>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>load_name</strong> (<em>str</em>) – corresponds to ‘loadName’ key in definition</p></li>
<li><p><strong>namespace</strong> (<em>str</em>) – The namespace the labware definition belongs to.
If unspecified, will search ‘opentrons’ then ‘custom_beta’</p></li>
<li><p><strong>version</strong> (<em>int</em>) – The version of the labware definition. If unspecified,
will use version 1.</p></li>
<li><p><strong>bundled_defs</strong> – A bundle of labware definitions to exlusively use for
finding labware definitions, if specified</p></li>
<li><p><strong>extra_defs</strong> – An extra set of definitions (in addition to the system
definitions) in which to search</p></li>
</ul>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.load">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">load</code><span class="sig-paren">(</span><em class="sig-param">load_name: str</em>, <em class="sig-param">parent: opentrons.types.Location</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em>, <em class="sig-param">bundled_defs: Dict[str</em>, <em class="sig-param">ForwardRef('LabwareDefinition')] = None</em>, <em class="sig-param">extra_defs: Dict[str</em>, <em class="sig-param">ForwardRef('LabwareDefinition')] = None</em>, <em class="sig-param">api_level: opentrons.protocols.types.APIVersion = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.labware.load" title="Permalink to this definition">¶</a></dt>
<dd><p>Return a labware object constructed from a labware definition dict looked
up by name (definition must have been previously stored locally on the
robot)</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>load_name</strong> – A string to use for looking up a labware definition
previously saved to disc. The definition file must have been saved in a
known location</p></li>
<li><p><strong>parent</strong> – A <a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">Location</span></code></a> representing the location where
the front and left most point of the outside of labware is
(often the front-left corner of a slot on the deck).</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional label that will override the labware’s
display name from its definition</p></li>
<li><p><strong>namespace</strong> (<em>str</em>) – The namespace the labware definition belongs to.
If unspecified, will search ‘opentrons’ then ‘custom_beta’</p></li>
<li><p><strong>version</strong> (<em>int</em>) – The version of the labware definition. If unspecified,
will use version 1.</p></li>
<li><p><strong>bundled_defs</strong> – If specified, a mapping of labware names to labware
definitions. Only the bundle will be searched for definitions.</p></li>
<li><p><strong>extra_defs</strong> – If specified, a mapping of labware names to labware
definitions. If no bundle is passed, these definitions will also be
searched.</p></li>
<li><p><strong>api_level</strong> (<em>APIVersion</em>) – the API version to set for the loaded labware
instance. The <a class="reference internal" href="#opentrons.protocol_api.labware.Labware" title="opentrons.protocol_api.labware.Labware"><code class="xref py py-class docutils literal notranslate"><span class="pre">Labware</span></code></a> will
conform to this level. If not specified,
defaults to <code class="xref py py-attr docutils literal notranslate"><span class="pre">MAX_SUPPORTED_VERSION</span></code>.</p></li>
</ul>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.load_from_definition">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">load_from_definition</code><span class="sig-paren">(</span><em class="sig-param">definition: 'LabwareDefinition'</em>, <em class="sig-param">parent: opentrons.types.Location</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">api_level: opentrons.protocols.types.APIVersion = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.labware.load_from_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Return a labware object constructed from a provided labware definition dict</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>definition</strong> – A dict representing all required data for a labware,
including metadata such as the display name of the labware, a
definition of the order to iterate over wells, the shape of wells
(shape, physical dimensions, etc), and so on. The correct shape of
this definition is governed by the “labware-designer” project in
the Opentrons/opentrons repo.</p></li>
<li><p><strong>parent</strong> – A <a class="reference internal" href="#opentrons.types.Location" title="opentrons.types.Location"><code class="xref py py-class docutils literal notranslate"><span class="pre">Location</span></code></a> representing the location where
the front and left most point of the outside of labware is
(often the front-left corner of a slot on the deck).</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional label that will override the labware’s
display name from its definition</p></li>
<li><p><strong>api_level</strong> (<em>APIVersion</em>) – the API version to set for the loaded labware
instance. The <a class="reference internal" href="#opentrons.protocol_api.labware.Labware" title="opentrons.protocol_api.labware.Labware"><code class="xref py py-class docutils literal notranslate"><span class="pre">Labware</span></code></a> will
conform to this level. If not specified,
defaults to <code class="xref py py-attr docutils literal notranslate"><span class="pre">MAX_SUPPORTED_VERSION</span></code>.</p></li>
</ul>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.quirks_from_any_parent">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">quirks_from_any_parent</code><span class="sig-paren">(</span><em class="sig-param">loc: Union[opentrons.protocol_api.labware.Labware, opentrons.protocol_api.labware.Well, str, ForwardRef('ModuleGeometry'), NoneType]</em><span class="sig-paren">)</span> → List[str]<a class="headerlink" href="#opentrons.protocol_api.labware.quirks_from_any_parent" title="Permalink to this definition">¶</a></dt>
<dd><p>Walk the tree of wells and labwares and extract quirks</p>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.save_definition">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">save_definition</code><span class="sig-paren">(</span><em class="sig-param">labware_def: 'LabwareDefinition'</em>, <em class="sig-param">force: bool = False</em>, <em class="sig-param">location: pathlib.Path = None</em><span class="sig-paren">)</span> → None<a class="headerlink" href="#opentrons.protocol_api.labware.save_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Save a labware definition</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>labware_def</strong> – A deserialized JSON labware definition</p></li>
<li><p><strong>force</strong> (<em>bool</em>) – If true, overwrite an existing definition if found.
Cannot overwrite Opentrons definitions.</p></li>
</ul>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.protocol_api.labware.verify_definition">
<code class="sig-prename descclassname">opentrons.protocol_api.labware.</code><code class="sig-name descname">verify_definition</code><span class="sig-paren">(</span><em class="sig-param">contents: Union[~AnyStr, ForwardRef('LabwareDefinition'), Dict[str, Any]]</em><span class="sig-paren">)</span> → 'LabwareDefinition'<a class="headerlink" href="#opentrons.protocol_api.labware.verify_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Verify that an input string is a labware definition and return it.</p>
<p>If the definition is invalid, an exception is raised; otherwise parse the
json and return the valid definition.</p>
<dl class="field-list simple">
<dt class="field-odd">Raises</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>json.JsonDecodeError</strong> – If the definition is not valid json</p></li>
<li><p><strong>jsonschema.ValidationError</strong> – If the definition is not valid.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The parsed definition</p>
</dd>
</dl>
</dd></dl>


<span id="protocol-api-modules"></span><h2 id="modules">Modules<a class="headerlink" href="#modules" title="Permalink to this headline">¶</a></h2>
<dl class="class">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.contexts.</code><code class="sig-name descname">TemperatureModuleContext</code><span class="sig-paren">(</span><em class="sig-param">ctx: ProtocolContext</em>, <em class="sig-param">hw_module: opentrons.hardware_control.modules.tempdeck.TempDeck</em>, <em class="sig-param">geometry: opentrons.protocol_api.module_geometry.ModuleGeometry</em>, <em class="sig-param">at_version: opentrons.protocols.types.APIVersion</em>, <em class="sig-param">loop: asyncio.events.AbstractEventLoop</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext" title="Permalink to this definition">¶</a></dt>
<dd><p>An object representing a connected Temperature Module.</p>
<p>It should not be instantiated directly; instead, it should be
created through <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_module" title="opentrons.protocol_api.contexts.ProtocolContext.load_module"><code class="xref py py-meth docutils literal notranslate"><span class="pre">ProtocolContext.load_module()</span></code></a> using:
<code class="docutils literal notranslate"><span class="pre">ctx.load_module('Temperature</span> <span class="pre">Module',</span> <span class="pre">slot_number)</span></code>.</p>
<p>A minimal protocol with a Temperature module would look like this:</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>In order to prevent physical obstruction of other slots, place the
Temperature Module in a slot on the horizontal edges of the deck (such
as 1, 4, 7, or 10 on the left or 3, 6, or 7 on the right), with the USB
cable and power cord pointing away from the deck.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.api_version" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.await_temperature">
<code class="sig-name descname">await_temperature</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">celsius: float</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.await_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Wait until module reaches temperature, in C.</p>
<p>Must be between 4 and 95C based on Opentrons QA.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>celsius</strong> – The target temperature, in C</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.3.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.deactivate">
<code class="sig-name descname">deactivate</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.deactivate" title="Permalink to this definition">¶</a></dt>
<dd><p>Stop heating (or cooling) and turn off the fan.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.geometry">
<em class="property">property </em><code class="sig-name descname">geometry</code><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.geometry" title="Permalink to this definition">¶</a></dt>
<dd><p>The object representing the module as an item on the deck</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>ModuleGeometry</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.labware">
<em class="property">property </em><code class="sig-name descname">labware</code><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.labware" title="Permalink to this definition">¶</a></dt>
<dd><p>The labware (if any) present on this module.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware">
<code class="sig-name descname">load_labware</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">name: str</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a piece of labware on the module.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>name</strong> – The name of the labware object.</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear as in the run
log and the calibration view in the Opentrons app.</p></li>
<li><p><strong>namespace</strong> (<em>str</em>) – The namespace the labware definition belongs to.
If unspecified, will search ‘opentrons’ then ‘custom_beta’</p></li>
<li><p><strong>version</strong> (<em>int</em>) – The version of the labware definition. If
unspecified, will use version 1.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The initialized and loaded labware object.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.1: </span>The <em>label,</em> <em>namespace,</em> and <em>version</em> parameters.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware_by_name">
<code class="sig-name descname">load_labware_by_name</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">name: str</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware_by_name" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.1.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware_from_definition">
<code class="sig-name descname">load_labware_from_definition</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">definition: 'LabwareDefinition'</em>, <em class="sig-param">label: str = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware_from_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a labware on the module, using an
inline definition.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>definition</strong> – The labware definition.</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear
as in the run log and the calibration view in the
Opentrons app.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The initialized and loaded labware object.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware_object">
<code class="sig-name descname">load_labware_object</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">labware: opentrons.protocol_api.labware.Labware</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware_object" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a piece of labware on the module.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>labware</strong> – The labware object. This object should be already
initialized and its parent should be set to this
module’s geometry. To initialize and load a labware
onto the module in one step, see
<a class="reference internal" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware" title="opentrons.protocol_api.contexts.TemperatureModuleContext.load_labware"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_labware()</span></code></a>.</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The properly-linked labware object</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.set_temperature">
<code class="sig-name descname">set_temperature</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">celsius: float</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.set_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Set the target temperature, in C.</p>
<p>Must be between 4 and 95C based on Opentrons QA.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>celsius</strong> – The target temperature, in C</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.status">
<em class="property">property </em><code class="sig-name descname">status</code><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.status" title="Permalink to this definition">¶</a></dt>
<dd><p>The status of the module.</p>
<p>Returns ‘holding at target’, ‘cooling’, ‘heating’, or ‘idle’</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.3.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.target">
<em class="property">property </em><code class="sig-name descname">target</code><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.target" title="Permalink to this definition">¶</a></dt>
<dd><p>Current target temperature in C</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.TemperatureModuleContext.temperature">
<em class="property">property </em><code class="sig-name descname">temperature</code><a class="headerlink" href="#opentrons.protocol_api.contexts.TemperatureModuleContext.temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Current temperature in C</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
</dd></dl>
<dl class="class">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.contexts.</code><code class="sig-name descname">MagneticModuleContext</code><span class="sig-paren">(</span><em class="sig-param">ctx: ProtocolContext</em>, <em class="sig-param">hw_module: opentrons.hardware_control.modules.magdeck.MagDeck</em>, <em class="sig-param">geometry: opentrons.protocol_api.module_geometry.ModuleGeometry</em>, <em class="sig-param">at_version: opentrons.protocols.types.APIVersion</em>, <em class="sig-param">loop: asyncio.events.AbstractEventLoop</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext" title="Permalink to this definition">¶</a></dt>
<dd><p>An object representing a connected Temperature Module.</p>
<p>It should not be instantiated directly; instead, it should be
created through <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_module" title="opentrons.protocol_api.contexts.ProtocolContext.load_module"><code class="xref py py-meth docutils literal notranslate"><span class="pre">ProtocolContext.load_module()</span></code></a>.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.api_version" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.calibrate">
<code class="sig-name descname">calibrate</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.calibrate" title="Permalink to this definition">¶</a></dt>
<dd><p>Calibrate the Magnetic Module.</p>
<p>The calibration is used to establish the position of the lawbare on
top of the magnetic module.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.disengage">
<code class="sig-name descname">disengage</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.disengage" title="Permalink to this definition">¶</a></dt>
<dd><p>Lower the magnets back into the Magnetic Module.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.engage">
<code class="sig-name descname">engage</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">height: float = None</em>, <em class="sig-param">offset: float = None</em>, <em class="sig-param">height_from_base: float = None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.engage" title="Permalink to this definition">¶</a></dt>
<dd><p>Raise the Magnetic Module’s magnets.</p>
<p>The destination of the magnets can be specified in several different
ways, based on internally stored default heights for labware:</p>
<blockquote>
<div><ul class="simple">
<li><p>If neither <code class="docutils literal notranslate"><span class="pre">height</span></code>, <code class="docutils literal notranslate"><span class="pre">height_from_base</span></code> nor <code class="docutils literal notranslate"><span class="pre">offset</span></code> is
specified, the magnets will raise to a reasonable default height
based on the specified labware.</p></li>
<li><p>The recommended way to adjust the height of the magnets is to
specify <code class="docutils literal notranslate"><span class="pre">height_from_base</span></code>, which should be a distance in mm
relative to the base of the labware that is on the magnetic module</p></li>
<li><p>If <code class="docutils literal notranslate"><span class="pre">height</span></code> is specified, it should be a distance in mm from the
home position of the magnets.</p></li>
<li><p>If <code class="docutils literal notranslate"><span class="pre">offset</span></code> is specified, it should be an offset in mm from the
default position. A positive number moves the magnets higher and
a negative number moves the magnets lower.</p></li>
</ul>
</div></blockquote>
<p>Only certain labwares have defined engage heights for the Magnetic
Module. If a labware that does not have a defined engage height is
loaded on the Magnetic Module (or if no labware is loaded), then
<code class="docutils literal notranslate"><span class="pre">height</span></code> or <code class="docutils literal notranslate"><span class="pre">height_from_labware</span></code> must be specified.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>height_from_base</strong> – The height to raise the magnets to, in mm from
the base of the labware</p></li>
<li><p><strong>height</strong> – The height to raise the magnets to, in mm from home.</p></li>
<li><p><strong>offset</strong> – An offset relative to the default height for the labware
in mm</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.1: </span>The <em>height_from_base</em> parameter.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.geometry">
<em class="property">property </em><code class="sig-name descname">geometry</code><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.geometry" title="Permalink to this definition">¶</a></dt>
<dd><p>The object representing the module as an item on the deck</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>ModuleGeometry</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.labware">
<em class="property">property </em><code class="sig-name descname">labware</code><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.labware" title="Permalink to this definition">¶</a></dt>
<dd><p>The labware (if any) present on this module.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.load_labware">
<code class="sig-name descname">load_labware</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">name: str</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.load_labware" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a piece of labware on the module.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>name</strong> – The name of the labware object.</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear as in the run
log and the calibration view in the Opentrons app.</p></li>
<li><p><strong>namespace</strong> (<em>str</em>) – The namespace the labware definition belongs to.
If unspecified, will search ‘opentrons’ then ‘custom_beta’</p></li>
<li><p><strong>version</strong> (<em>int</em>) – The version of the labware definition. If
unspecified, will use version 1.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The initialized and loaded labware object.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.1: </span>The <em>label,</em> <em>namespace,</em> and <em>version</em> parameters.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.load_labware_by_name">
<code class="sig-name descname">load_labware_by_name</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">name: str</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.load_labware_by_name" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.1.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.load_labware_from_definition">
<code class="sig-name descname">load_labware_from_definition</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">definition: 'LabwareDefinition'</em>, <em class="sig-param">label: str = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.load_labware_from_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a labware on the module, using an
inline definition.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>definition</strong> – The labware definition.</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear
as in the run log and the calibration view in the
Opentrons app.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The initialized and loaded labware object.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.load_labware_object">
<code class="sig-name descname">load_labware_object</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">labware: opentrons.protocol_api.labware.Labware</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.load_labware_object" title="Permalink to this definition">¶</a></dt>
<dd><p>Load labware onto a Magnetic Module, checking if it is compatible</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.MagneticModuleContext.status">
<em class="property">property </em><code class="sig-name descname">status</code><a class="headerlink" href="#opentrons.protocol_api.contexts.MagneticModuleContext.status" title="Permalink to this definition">¶</a></dt>
<dd><p>The status of the module. either ‘engaged’ or ‘disengaged’</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
</dd></dl>
<dl class="class">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.protocol_api.contexts.</code><code class="sig-name descname">ThermocyclerContext</code><span class="sig-paren">(</span><em class="sig-param">ctx: ProtocolContext</em>, <em class="sig-param">hw_module: opentrons.hardware_control.modules.thermocycler.Thermocycler</em>, <em class="sig-param">geometry: opentrons.protocol_api.module_geometry.ThermocyclerGeometry</em>, <em class="sig-param">at_version: opentrons.protocols.types.APIVersion</em>, <em class="sig-param">loop: asyncio.events.AbstractEventLoop</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext" title="Permalink to this definition">¶</a></dt>
<dd><p>An object representing a connected Temperature Module.</p>
<p>It should not be instantiated directly; instead, it should be
created through <a class="reference internal" href="#opentrons.protocol_api.contexts.ProtocolContext.load_module" title="opentrons.protocol_api.contexts.ProtocolContext.load_module"><code class="xref py py-meth docutils literal notranslate"><span class="pre">ProtocolContext.load_module()</span></code></a>.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.api_version">
<em class="property">property </em><code class="sig-name descname">api_version</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.api_version" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.block_target_temperature">
<em class="property">property </em><code class="sig-name descname">block_target_temperature</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.block_target_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Target temperature in degrees C</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.block_temperature">
<em class="property">property </em><code class="sig-name descname">block_temperature</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.block_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Current temperature in degrees C</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.block_temperature_status">
<em class="property">property </em><code class="sig-name descname">block_temperature_status</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.block_temperature_status" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.close_lid">
<code class="sig-name descname">close_lid</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.close_lid" title="Permalink to this definition">¶</a></dt>
<dd><p>Closes the lid</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.deactivate">
<code class="sig-name descname">deactivate</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.deactivate" title="Permalink to this definition">¶</a></dt>
<dd><p>Turn off the well block temperature controller, and heated lid</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.deactivate_block">
<code class="sig-name descname">deactivate_block</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.deactivate_block" title="Permalink to this definition">¶</a></dt>
<dd><p>Turn off the well block temperature controller</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.deactivate_lid">
<code class="sig-name descname">deactivate_lid</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.deactivate_lid" title="Permalink to this definition">¶</a></dt>
<dd><p>Turn off the heated lid</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.execute_profile">
<code class="sig-name descname">execute_profile</code><span class="sig-paren">(</span><em class="sig-param">self, steps: List[Dict[str, float]], repetitions: int, block_max_volume: float = None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.execute_profile" title="Permalink to this definition">¶</a></dt>
<dd><p>Execute a Thermocycler Profile defined as a cycle of
<code class="xref py py-attr docutils literal notranslate"><span class="pre">steps</span></code> to repeat for a given number of <code class="xref py py-attr docutils literal notranslate"><span class="pre">repetitions</span></code></p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>steps</strong> – List of unique steps that make up a single cycle.
Each list item should be a dictionary that maps to
the parameters of the <a class="reference internal" href="#opentrons.protocol_api.contexts.ThermocyclerContext.set_block_temperature" title="opentrons.protocol_api.contexts.ThermocyclerContext.set_block_temperature"><code class="xref py py-meth docutils literal notranslate"><span class="pre">set_block_temperature()</span></code></a>
method with keys ‘temperature’, ‘hold_time_seconds’,
and ‘hold_time_minutes’.</p></li>
<li><p><strong>repetitions</strong> – The number of times to repeat the cycled steps.</p></li>
<li><p><strong>block_max_volume</strong> – The maximum volume of any individual well
of the loaded labware. If not supplied,
the thermocycler will default to 25µL/well.</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.geometry">
<em class="property">property </em><code class="sig-name descname">geometry</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.geometry" title="Permalink to this definition">¶</a></dt>
<dd><p>The object representing the module as an item on the deck</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>ModuleGeometry</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.labware">
<em class="property">property </em><code class="sig-name descname">labware</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.labware" title="Permalink to this definition">¶</a></dt>
<dd><p>The labware (if any) present on this module.</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.lid_position">
<em class="property">property </em><code class="sig-name descname">lid_position</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.lid_position" title="Permalink to this definition">¶</a></dt>
<dd><p>Lid open/close status string</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.lid_target_temperature">
<em class="property">property </em><code class="sig-name descname">lid_target_temperature</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.lid_target_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Target temperature in degrees C</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.lid_temperature">
<em class="property">property </em><code class="sig-name descname">lid_temperature</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.lid_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Current temperature in degrees C</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.lid_temperature_status">
<em class="property">property </em><code class="sig-name descname">lid_temperature_status</code><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.lid_temperature_status" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.load_labware">
<code class="sig-name descname">load_labware</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">name: str</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.load_labware" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a piece of labware on the module.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>name</strong> – The name of the labware object.</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear as in the run
log and the calibration view in the Opentrons app.</p></li>
<li><p><strong>namespace</strong> (<em>str</em>) – The namespace the labware definition belongs to.
If unspecified, will search ‘opentrons’ then ‘custom_beta’</p></li>
<li><p><strong>version</strong> (<em>int</em>) – The version of the labware definition. If
unspecified, will use version 1.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The initialized and loaded labware object.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.1: </span>The <em>label,</em> <em>namespace,</em> and <em>version</em> parameters.</p>
</div>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.load_labware_by_name">
<code class="sig-name descname">load_labware_by_name</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">name: str</em>, <em class="sig-param">label: str = None</em>, <em class="sig-param">namespace: str = None</em>, <em class="sig-param">version: int = 1</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.load_labware_by_name" title="Permalink to this definition">¶</a></dt>
<dd><div class="versionadded">
<p><span class="versionmodified added">New in version 2.1.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.load_labware_from_definition">
<code class="sig-name descname">load_labware_from_definition</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">definition: 'LabwareDefinition'</em>, <em class="sig-param">label: str = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.load_labware_from_definition" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a labware on the module, using an
inline definition.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>definition</strong> – The labware definition.</p></li>
<li><p><strong>label</strong> (<em>str</em>) – An optional special name to give the labware. If
specified, this is the name the labware will appear
as in the run log and the calibration view in the
Opentrons app.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The initialized and loaded labware object.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.load_labware_object">
<code class="sig-name descname">load_labware_object</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">labware: opentrons.protocol_api.labware.Labware</em><span class="sig-paren">)</span> → opentrons.protocol_api.labware.Labware<a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.load_labware_object" title="Permalink to this definition">¶</a></dt>
<dd><p>Specify the presence of a piece of labware on the module.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>labware</strong> – The labware object. This object should be already
initialized and its parent should be set to this
module’s geometry. To initialize and load a labware
onto the module in one step, see
<a class="reference internal" href="#opentrons.protocol_api.contexts.ThermocyclerContext.load_labware" title="opentrons.protocol_api.contexts.ThermocyclerContext.load_labware"><code class="xref py py-meth docutils literal notranslate"><span class="pre">load_labware()</span></code></a>.</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The properly-linked labware object</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.open_lid">
<code class="sig-name descname">open_lid</code><span class="sig-paren">(</span><em class="sig-param">self</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.open_lid" title="Permalink to this definition">¶</a></dt>
<dd><p>Opens the lid</p>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.set_block_temperature">
<code class="sig-name descname">set_block_temperature</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">temperature: float</em>, <em class="sig-param">hold_time_seconds: float = None</em>, <em class="sig-param">hold_time_minutes: float = None</em>, <em class="sig-param">ramp_rate: float = None</em>, <em class="sig-param">block_max_volume: float = None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.set_block_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Set the target temperature for the well block, in °C.</p>
<p>Valid operational range yet to be determined.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>temperature</strong> – The target temperature, in °C.</p></li>
<li><p><strong>hold_time_minutes</strong> – The number of minutes to hold, after reaching
<code class="docutils literal notranslate"><span class="pre">temperature</span></code>, before proceeding to the
next command.</p></li>
<li><p><strong>hold_time_seconds</strong> – The number of seconds to hold, after reaching
<code class="docutils literal notranslate"><span class="pre">temperature</span></code>, before proceeding to the
next command. If <code class="docutils literal notranslate"><span class="pre">hold_time_minutes</span></code> and
<code class="docutils literal notranslate"><span class="pre">hold_time_seconds</span></code> are not specified,
the Thermocycler will proceed to the next
command after <code class="docutils literal notranslate"><span class="pre">temperature</span></code> is reached.</p></li>
<li><p><strong>ramp_rate</strong> – The target rate of temperature change, in °C/sec.
If <code class="docutils literal notranslate"><span class="pre">ramp_rate</span></code> is not specified, it will default
to the maximum ramp rate as defined in the device
configuration.</p></li>
<li><p><strong>block_max_volume</strong> – The maximum volume of any individual well
of the loaded labware. If not supplied,
the thermocycler will default to 25µL/well.</p></li>
</ul>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.protocol_api.contexts.ThermocyclerContext.set_lid_temperature">
<code class="sig-name descname">set_lid_temperature</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">temperature: float</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.protocol_api.contexts.ThermocyclerContext.set_lid_temperature" title="Permalink to this definition">¶</a></dt>
<dd><p>Set the target temperature for the heated lid, in °C.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>temperature</strong> – The target temperature, in °C clamped to the
range 20°C to 105°C.</p>
</dd>
</dl>
<div class="versionadded">
<p><span class="versionmodified added">New in version 2.0.</span></p>
</div>
</dd></dl>
</dd></dl>


<span id="useful-types-and-definitions"></span><span id="protocol-api-types"></span><h2 id="module-opentrons.types">Useful Types and Definitions<a class="headerlink" href="#module-opentrons.types" title="Permalink to this headline">¶</a></h2>
<dl class="class">
<dt id="opentrons.types.Location">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.types.</code><code class="sig-name descname">Location</code><a class="headerlink" href="#opentrons.types.Location" title="Permalink to this definition">¶</a></dt>
<dd><p>A location to target as a motion.</p>
<p>The location contains a <a class="reference internal" href="#opentrons.types.Point" title="opentrons.types.Point"><code class="xref py py-class docutils literal notranslate"><span class="pre">Point</span></code></a> (in
<a class="reference internal" href="#protocol-api-deck-coords"><span class="std std-ref">Deck Coordinates</span></a>) and possibly an associated
<a class="reference internal" href="#opentrons.protocol_api.labware.Labware" title="opentrons.protocol_api.labware.Labware"><code class="xref py py-class docutils literal notranslate"><span class="pre">Labware</span></code></a> or <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> instance.</p>
<p>It should rarely be constructed directly by the user; rather, it is the
return type of most <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">Well</span></code></a> accessors like <a class="reference internal" href="#opentrons.protocol_api.labware.Well.top" title="opentrons.protocol_api.labware.Well.top"><code class="xref py py-meth docutils literal notranslate"><span class="pre">Well.top()</span></code></a>
and is passed directly into a method like
<code class="xref py py-meth docutils literal notranslate"><span class="pre">InstrumentContext.aspirate()</span></code>.</p>
<div class="admonition warning">
<p class="admonition-title">Warning</p>
<p>The <a class="reference internal" href="#opentrons.types.Location.labware" title="opentrons.types.Location.labware"><code class="xref py py-attr docutils literal notranslate"><span class="pre">labware</span></code></a> attribute of this class is used by the protocol
API internals to, among other things, determine safe heights to retract
the instruments to when moving between locations. If constructing an
instance of this class manually, be sure to either specify <cite>None</cite> as the
labware (so the robot does its worst case retraction) or specify the
correct labware for the <a class="reference internal" href="#opentrons.types.Location.point" title="opentrons.types.Location.point"><code class="xref py py-attr docutils literal notranslate"><span class="pre">point</span></code></a> attribute.</p>
</div>
<div class="admonition warning">
<p class="admonition-title">Warning</p>
<p>The <cite>==</cite> operation compares both the position and associated labware.
If you only need to compare locations, compare the <a class="reference internal" href="#opentrons.types.Location.point" title="opentrons.types.Location.point"><code class="xref py py-attr docutils literal notranslate"><span class="pre">point</span></code></a>
of each item.</p>
</div>
<dl class="method">
<dt id="opentrons.types.Location.labware">
<em class="property">property </em><code class="sig-name descname">labware</code><a class="headerlink" href="#opentrons.types.Location.labware" title="Permalink to this definition">¶</a></dt>
<dd><p>Alias for field number 1</p>
</dd></dl>
<dl class="method">
<dt id="opentrons.types.Location.move">
<code class="sig-name descname">move</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">point: opentrons.types.Point</em><span class="sig-paren">)</span> → 'Location'<a class="headerlink" href="#opentrons.types.Location.move" title="Permalink to this definition">¶</a></dt>
<dd><p>Alter the point stored in the location while preserving the labware.</p>
<p>This returns a new Location and does not alter the current one. It
should be used like</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="gp">&gt;&gt;&gt; </span><span class="n">loc</span> <span class="o">=</span> <span class="n">Location</span><span class="p">(</span><span class="n">Point</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">),</span> <span class="s1">'Hi'</span><span class="p">)</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">new_loc</span> <span class="o">=</span> <span class="n">loc</span><span class="o">.</span><span class="n">move</span><span class="p">(</span><span class="n">Point</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">))</span>
<span class="gp">&gt;&gt;&gt; </span><span class="k">assert</span> <span class="n">loc_2</span><span class="o">.</span><span class="n">point</span> <span class="o">==</span> <span class="n">Point</span><span class="p">(</span><span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">)</span>  <span class="c1"># True</span>
<span class="gp">&gt;&gt;&gt; </span><span class="k">assert</span> <span class="n">loc</span><span class="o">.</span><span class="n">point</span> <span class="o">==</span> <span class="n">Point</span><span class="p">(</span><span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">1</span><span class="p">)</span>  <span class="c1"># True</span>
</pre></div>
</div>
</dd></dl>
<dl class="method">
<dt id="opentrons.types.Location.point">
<em class="property">property </em><code class="sig-name descname">point</code><a class="headerlink" href="#opentrons.types.Location.point" title="Permalink to this definition">¶</a></dt>
<dd><p>Alias for field number 0</p>
</dd></dl>
</dd></dl>
<dl class="class">
<dt id="opentrons.types.Mount">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.types.</code><code class="sig-name descname">Mount</code><a class="headerlink" href="#opentrons.types.Mount" title="Permalink to this definition">¶</a></dt>
<dd><p>An enumeration.</p>
</dd></dl>
<dl class="exception">
<dt id="opentrons.types.PipetteNotAttachedError">
<em class="property">exception </em><code class="sig-prename descclassname">opentrons.types.</code><code class="sig-name descname">PipetteNotAttachedError</code><a class="headerlink" href="#opentrons.types.PipetteNotAttachedError" title="Permalink to this definition">¶</a></dt>
<dd><p>An error raised if a pipette is accessed that is not attached</p>
</dd></dl>
<dl class="class">
<dt id="opentrons.types.Point">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.types.</code><code class="sig-name descname">Point</code><span class="sig-paren">(</span><em class="sig-param">x</em>, <em class="sig-param">y</em>, <em class="sig-param">z</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.types.Point" title="Permalink to this definition">¶</a></dt>
<dd><dl class="method">
<dt id="opentrons.types.Point.x">
<em class="property">property </em><code class="sig-name descname">x</code><a class="headerlink" href="#opentrons.types.Point.x" title="Permalink to this definition">¶</a></dt>
<dd><p>Alias for field number 0</p>
</dd></dl>
<dl class="method">
<dt id="opentrons.types.Point.y">
<em class="property">property </em><code class="sig-name descname">y</code><a class="headerlink" href="#opentrons.types.Point.y" title="Permalink to this definition">¶</a></dt>
<dd><p>Alias for field number 1</p>
</dd></dl>
<dl class="method">
<dt id="opentrons.types.Point.z">
<em class="property">property </em><code class="sig-name descname">z</code><a class="headerlink" href="#opentrons.types.Point.z" title="Permalink to this definition">¶</a></dt>
<dd><p>Alias for field number 2</p>
</dd></dl>
</dd></dl>
<dl class="class">
<dt id="opentrons.types.TransferTipPolicy">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.types.</code><code class="sig-name descname">TransferTipPolicy</code><a class="headerlink" href="#opentrons.types.TransferTipPolicy" title="Permalink to this definition">¶</a></dt>
<dd><p>An enumeration.</p>
</dd></dl>


<span id="executing-and-simulating-protocols"></span><h2 id="module-opentrons.execute">Executing and Simulating Protocols<a class="headerlink" href="#module-opentrons.execute" title="Permalink to this headline">¶</a></h2>
<p>opentrons.execute: functions and entrypoint for running protocols</p>
<p>This module has functions that can be imported to provide protocol
contexts for running protocols during interactive sessions like Jupyter or just
regular python shells. It also provides a console entrypoint for running a
protocol from the command line.</p>
<dl class="function">
<dt id="opentrons.execute.execute">
<code class="sig-prename descclassname">opentrons.execute.</code><code class="sig-name descname">execute</code><span class="sig-paren">(</span><em class="sig-param">protocol_file: &lt;class 'TextIO'&gt;, protocol_name: str, propagate_logs: bool = False, log_level: str = 'warning', emit_runlog: Callable[[Dict[str, Any]], NoneType] = None, custom_labware_paths: List[str] = None, custom_data_paths: List[str] = None</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.execute.execute" title="Permalink to this definition">¶</a></dt>
<dd><p>Run the protocol itself.</p>
<p>This is a one-stop function to run a protocol, whether python or json,
no matter the api verson, from external (i.e. not bound up in other
internal server infrastructure) sources.</p>
<p>To run an opentrons protocol from other places, pass in a file like
object as protocol_file; this function either returns (if the run has no
problems) or raises an exception.</p>
<p>To call from the command line use either the autogenerated entrypoint
<code class="docutils literal notranslate"><span class="pre">opentrons_execute</span></code> or <code class="docutils literal notranslate"><span class="pre">python</span> <span class="pre">-m</span> <span class="pre">opentrons.execute</span></code>.</p>
<p>If the protocol is using Opentrons Protocol API V1, it does not need to
explicitly call <code class="xref py py-meth docutils literal notranslate"><span class="pre">Robot.connect()</span></code>
or <code class="xref py py-meth docutils literal notranslate"><span class="pre">Robot.discover_modules()</span></code>, or
<code class="xref py py-meth docutils literal notranslate"><span class="pre">Robot.cache_instrument_models()</span></code>.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>protocol_file</strong> (<em>file-like</em>) – The protocol file to execute</p></li>
<li><p><strong>protocol_name</strong> (<em>str</em>) – The name of the protocol file. This is required
internally, but it may not be a thing we can get
from the protocol_file argument.</p></li>
<li><p><strong>propagate_logs</strong> (<em>bool</em>) – Whether this function should allow logs from the
Opentrons stack to propagate up to the root handler.
This can be useful if you’re integrating this
function in a larger application, but most logs that
occur during protocol simulation are best associated
with the actions in the protocol that cause them.
Default: <code class="docutils literal notranslate"><span class="pre">False</span></code></p></li>
<li><p><strong>log_level</strong> (<em>'debug'</em><em>, </em><em>'info'</em><em>, </em><em>'warning'</em><em>, or </em><em>'error'</em>) – The level of logs to emit on the command line.. Default:
‘warning’</p></li>
<li><p><strong>emit_runlog</strong> – A callback for printing the runlog. If specified, this
will be called whenever a command adds an entry to the
runlog, which can be used for display and progress
estimation. If specified, the callback should take a
single argument (the name doesn’t matter) which will
be a dictionary (see below). Default: <code class="docutils literal notranslate"><span class="pre">None</span></code></p></li>
<li><p><strong>custom_labware_paths</strong> – A list of directories to search for custom
labware, or None. Ignored if the apiv2 feature
flag is not set. Loads valid labware from
these paths and makes them available to the
protocol context.</p></li>
<li><p><strong>custom_data_paths</strong> – A list of directories or files to load custom
data files from. Ignored if the apiv2 feature
flag if not set. Entries may be either files or
directories. Specified files and the
non-recursive contents of specified directories
are presented by the protocol context in
<code class="xref py py-attr docutils literal notranslate"><span class="pre">ProtocolContext.bundled_data</span></code>.</p></li>
</ul>
</dd>
</dl>
<p>The format of the runlog entries is as follows:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="p">{</span>
    <span class="s1">'name'</span><span class="p">:</span> <span class="n">command_name</span><span class="p">,</span>
    <span class="s1">'payload'</span><span class="p">:</span> <span class="p">{</span>
         <span class="s1">'text'</span><span class="p">:</span> <span class="n">string_command_text</span><span class="p">,</span>
          <span class="c1"># The rest of this struct is command-dependent; see</span>
          <span class="c1"># opentrons.commands.commands. Its keys match format</span>
          <span class="c1"># keys in 'text', so that</span>
          <span class="c1"># entry['payload']['text'].format(**entry['payload'])</span>
          <span class="c1"># will produce a string with information filled in</span>
     <span class="p">}</span>
<span class="p">}</span>
</pre></div>
</div>
</dd></dl>
<dl class="function">
<dt id="opentrons.execute.get_arguments">
<code class="sig-prename descclassname">opentrons.execute.</code><code class="sig-name descname">get_arguments</code><span class="sig-paren">(</span><em class="sig-param">parser: argparse.ArgumentParser</em><span class="sig-paren">)</span> → argparse.ArgumentParser<a class="headerlink" href="#opentrons.execute.get_arguments" title="Permalink to this definition">¶</a></dt>
<dd><p>Get the argument parser for this module</p>
<p>Useful if you want to use this module as a component of another CLI program
and want to add its arguments.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>parser</strong> – A parser to add arguments to.</p>
</dd>
<dt class="field-even">Returns argparse.ArgumentParser</dt>
<dd class="field-even"><p>The parser with arguments added.</p>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.execute.get_protocol_api">
<code class="sig-prename descclassname">opentrons.execute.</code><code class="sig-name descname">get_protocol_api</code><span class="sig-paren">(</span><em class="sig-param">version: Union[str, opentrons.protocols.types.APIVersion], bundled_labware: Dict[str, ForwardRef('LabwareDefinition')] = None, bundled_data: Dict[str, bytes] = None, extra_labware: Dict[str, ForwardRef('LabwareDefinition')] = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.protocol_context.ProtocolContext<a class="headerlink" href="#opentrons.execute.get_protocol_api" title="Permalink to this definition">¶</a></dt>
<dd><p>Build and return a <code class="xref py py-class docutils literal notranslate"><span class="pre">ProtocolContext</span></code> connected to the robot.</p>
<p>This can be used to run protocols from interactive Python sessions
such as Jupyter or an interpreter on the command line:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="gp">&gt;&gt;&gt; </span><span class="kn">from</span> <span class="nn">opentrons.execute</span> <span class="kn">import</span> <span class="n">get_protocol_api</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">protocol</span> <span class="o">=</span> <span class="n">get_protocol_api</span><span class="p">(</span><span class="s1">'2.0'</span><span class="p">)</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">instr</span> <span class="o">=</span> <span class="n">protocol</span><span class="o">.</span><span class="n">load_instrument</span><span class="p">(</span><span class="s1">'p300_single'</span><span class="p">,</span> <span class="s1">'right'</span><span class="p">)</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">instr</span><span class="o">.</span><span class="n">home</span><span class="p">()</span>
</pre></div>
</div>
<p>If <code class="docutils literal notranslate"><span class="pre">extra_labware</span></code> is not specified, any labware definitions saved in
the <code class="docutils literal notranslate"><span class="pre">labware</span></code> directory of the Jupyter notebook directory will be
available.</p>
<p>When this function is called, modules and instruments will be recached.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>version</strong> – The API version to use. This must be lower than
<code class="xref py py-attr docutils literal notranslate"><span class="pre">opentrons.protocol_api.MAX_SUPPORTED_VERSION</span></code>.
It may be specified either as a string (<code class="docutils literal notranslate"><span class="pre">'2.0'</span></code>) or
as a <code class="xref py py-class docutils literal notranslate"><span class="pre">protocols.types.APIVersion</span></code>
(<code class="docutils literal notranslate"><span class="pre">APIVersion(2,</span> <span class="pre">0)</span></code>).</p></li>
<li><p><strong>bundled_labware</strong> – If specified, a mapping from labware names to
labware definitions for labware to consider in the
protocol. Note that if you specify this, _only_
labware in this argument will be allowed in the
protocol. This is preparation for a beta feature
and is best not used.</p></li>
<li><p><strong>bundled_data</strong> – If specified, a mapping from filenames to contents
for data to be available in the protocol from
<code class="xref py py-attr docutils literal notranslate"><span class="pre">ProtocolContext.bundled_data</span></code>.</p></li>
<li><p><strong>extra_labware</strong> – If specified, a mapping from labware names to
labware definitions for labware to consider in the
protocol in addition to those stored on the robot.
If this is an empty dict, and this function is called
on a robot, it will look in the ‘labware’
subdirectory of the Jupyter data directory for
custom labware.</p></li>
</ul>
</dd>
<dt class="field-even">Returns opentrons.protocol_api.ProtocolContext</dt>
<dd class="field-even"><p>The protocol context.</p>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.execute.main">
<code class="sig-prename descclassname">opentrons.execute.</code><code class="sig-name descname">main</code><span class="sig-paren">(</span><span class="sig-paren">)</span> → int<a class="headerlink" href="#opentrons.execute.main" title="Permalink to this definition">¶</a></dt>
<dd><p>Handler for command line invocation to run a protocol.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>argv</strong> – The arguments the program was invoked with; this is usually
<code class="xref py py-attr docutils literal notranslate"><span class="pre">sys.argv</span></code> but if you want to override that you can.</p>
</dd>
<dt class="field-even">Returns int</dt>
<dd class="field-even"><p>A success or failure value suitable for use as a shell
return code passed to <code class="xref py py-meth docutils literal notranslate"><span class="pre">sys.exit()</span></code> (0 means success,
anything else is a kind of failure).</p>
</dd>
</dl>
</dd></dl>
<span class="target" id="module-opentrons.simulate"></span><p>opentrons.simulate: functions and entrypoints for simulating protocols</p>
<p>This module has functions that provide a console entrypoint for simulating
a protocol from the command line.</p>
<dl class="class">
<dt id="opentrons.simulate.AccumulatingHandler">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">AccumulatingHandler</code><span class="sig-paren">(</span><em class="sig-param">level</em>, <em class="sig-param">command_queue</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.simulate.AccumulatingHandler" title="Permalink to this definition">¶</a></dt>
<dd><dl class="method">
<dt id="opentrons.simulate.AccumulatingHandler.emit">
<code class="sig-name descname">emit</code><span class="sig-paren">(</span><em class="sig-param">self</em>, <em class="sig-param">record</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.simulate.AccumulatingHandler.emit" title="Permalink to this definition">¶</a></dt>
<dd><p>Do whatever it takes to actually log the specified logging record.</p>
<p>This version is intended to be implemented by subclasses and so
raises a NotImplementedError.</p>
</dd></dl>
</dd></dl>
<dl class="class">
<dt id="opentrons.simulate.CommandScraper">
<em class="property">class </em><code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">CommandScraper</code><span class="sig-paren">(</span><em class="sig-param">logger: logging.Logger</em>, <em class="sig-param">level: str</em>, <em class="sig-param">broker: opentrons.broker.Broker</em><span class="sig-paren">)</span><a class="headerlink" href="#opentrons.simulate.CommandScraper" title="Permalink to this definition">¶</a></dt>
<dd><p>An object that handles scraping the broker for commands</p>
<p>This should be instantiated with the logger to integrate
messages from (e.g. <code class="docutils literal notranslate"><span class="pre">logging.getLogger('opentrons')</span></code>), the
level to scrape, and the opentrons broker object to subscribe to.</p>
<p>The <a class="reference internal" href="#opentrons.simulate.CommandScraper.commands" title="opentrons.simulate.CommandScraper.commands"><code class="xref py py-attr docutils literal notranslate"><span class="pre">commands</span></code></a> property contains the list of commands
and log messages integrated together. Each element of the list is
a dict following the pattern in the docs of <a class="reference internal" href="#opentrons.simulate.simulate" title="opentrons.simulate.simulate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">simulate()</span></code></a>.</p>
<dl class="method">
<dt id="opentrons.simulate.CommandScraper.commands">
<em class="property">property </em><code class="sig-name descname">commands</code><a class="headerlink" href="#opentrons.simulate.CommandScraper.commands" title="Permalink to this definition">¶</a></dt>
<dd><p>The list of commands. See <a class="reference internal" href="#opentrons.simulate.simulate" title="opentrons.simulate.simulate"><code class="xref py py-meth docutils literal notranslate"><span class="pre">simulate()</span></code></a></p>
</dd></dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.allow_bundle">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">allow_bundle</code><span class="sig-paren">(</span><span class="sig-paren">)</span> → bool<a class="headerlink" href="#opentrons.simulate.allow_bundle" title="Permalink to this definition">¶</a></dt>
<dd><p>Check if bundling is allowed with a special not-exposed-to-the-app flag.</p>
<p>Returns <code class="docutils literal notranslate"><span class="pre">True</span></code> if the environment variable
<code class="docutils literal notranslate"><span class="pre">OT_API_FF_allowBundleCreation</span></code> is <code class="docutils literal notranslate"><span class="pre">"1"</span></code></p>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.bundle_from_sim">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">bundle_from_sim</code><span class="sig-paren">(</span><em class="sig-param">protocol: opentrons.protocols.types.PythonProtocol</em>, <em class="sig-param">context: opentrons.protocol_api.protocol_context.ProtocolContext</em><span class="sig-paren">)</span> → opentrons.protocols.types.BundleContents<a class="headerlink" href="#opentrons.simulate.bundle_from_sim" title="Permalink to this definition">¶</a></dt>
<dd><p>From a protocol, and the context that has finished simulating that
protocol, determine what needs to go in a bundle for the protocol.</p>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.format_runlog">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">format_runlog</code><span class="sig-paren">(</span><em class="sig-param">runlog: List[Mapping[str, Any]]</em><span class="sig-paren">)</span> → str<a class="headerlink" href="#opentrons.simulate.format_runlog" title="Permalink to this definition">¶</a></dt>
<dd><p>Format a run log (return value of <code class="xref py py-meth docutils literal notranslate"><span class="pre">simulate`()</span></code>) into a
human-readable string</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>runlog</strong> – The output of a call to <a class="reference internal" href="#opentrons.simulate.simulate" title="opentrons.simulate.simulate"><code class="xref py py-func docutils literal notranslate"><span class="pre">simulate()</span></code></a></p>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.get_arguments">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">get_arguments</code><span class="sig-paren">(</span><em class="sig-param">parser: argparse.ArgumentParser</em><span class="sig-paren">)</span> → argparse.ArgumentParser<a class="headerlink" href="#opentrons.simulate.get_arguments" title="Permalink to this definition">¶</a></dt>
<dd><p>Get the argument parser for this module</p>
<p>Useful if you want to use this module as a component of another CLI program
and want to add its arguments.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>parser</strong> – A parser to add arguments to. If not specified, one will be
created.</p>
</dd>
<dt class="field-even">Returns argparse.ArgumentParser</dt>
<dd class="field-even"><p>The parser with arguments added.</p>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.get_protocol_api">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">get_protocol_api</code><span class="sig-paren">(</span><em class="sig-param">version: Union[str, opentrons.protocols.types.APIVersion], bundled_labware: Dict[str, ForwardRef('LabwareDefinition')] = None, bundled_data: Dict[str, bytes] = None, extra_labware: Dict[str, ForwardRef('LabwareDefinition')] = None, hardware_simulator: Union[opentrons.hardware_control.thread_manager.ThreadManager, opentrons.hardware_control.adapters.SynchronousAdapter, ForwardRef('HasLoop')] = None</em><span class="sig-paren">)</span> → opentrons.protocol_api.protocol_context.ProtocolContext<a class="headerlink" href="#opentrons.simulate.get_protocol_api" title="Permalink to this definition">¶</a></dt>
<dd><p>Build and return a <code class="xref py py-class docutils literal notranslate"><span class="pre">ProtocolContext</span></code> connected to
Virtual Smoothie.</p>
<p>This can be used to run protocols from interactive Python sessions
such as Jupyter or an interpreter on the command line:</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="gp">&gt;&gt;&gt; </span><span class="kn">from</span> <span class="nn">opentrons.simulate</span> <span class="kn">import</span> <span class="n">get_protocol_api</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">protocol</span> <span class="o">=</span> <span class="n">get_protocol_api</span><span class="p">(</span><span class="s1">'2.0'</span><span class="p">)</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">instr</span> <span class="o">=</span> <span class="n">protocol</span><span class="o">.</span><span class="n">load_instrument</span><span class="p">(</span><span class="s1">'p300_single'</span><span class="p">,</span> <span class="s1">'right'</span><span class="p">)</span>
<span class="gp">&gt;&gt;&gt; </span><span class="n">instr</span><span class="o">.</span><span class="n">home</span><span class="p">()</span>
</pre></div>
</div>
<p>If <code class="docutils literal notranslate"><span class="pre">extra_labware</span></code> is not specified, any labware definitions saved in
the <code class="docutils literal notranslate"><span class="pre">labware</span></code> directory of the Jupyter notebook directory will be
available.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>version</strong> – The API version to use. This must be lower than
<code class="xref py py-attr docutils literal notranslate"><span class="pre">opentrons.protocol_api.MAX_SUPPORTED_VERSION</span></code>.
It may be specified either as a string (<code class="docutils literal notranslate"><span class="pre">'2.0'</span></code>) or
as a <code class="xref py py-class docutils literal notranslate"><span class="pre">protocols.types.APIVersion</span></code>
(<code class="docutils literal notranslate"><span class="pre">APIVersion(2,</span> <span class="pre">0)</span></code>).</p></li>
<li><p><strong>bundled_labware</strong> – If specified, a mapping from labware names to
labware definitions for labware to consider in the
protocol. Note that if you specify this, _only_
labware in this argument will be allowed in the
protocol. This is preparation for a beta feature
and is best not used.</p></li>
<li><p><strong>bundled_data</strong> – If specified, a mapping from filenames to contents
for data to be available in the protocol from
<code class="xref py py-attr docutils literal notranslate"><span class="pre">ProtocolContext.bundled_data</span></code>.</p></li>
<li><p><strong>extra_labware</strong> – If specified, a mapping from labware names to
labware definitions for labware to consider in the
protocol in addition to those stored on the robot.
If this is an empty dict, and this function is called
on a robot, it will look in the ‘labware’
subdirectory of the Jupyter data directory for
custom labware.</p></li>
<li><p><strong>hardware_simulator</strong> – If specified, a hardware simulator instance.</p></li>
</ul>
</dd>
<dt class="field-even">Returns opentrons.protocol_api.ProtocolContext</dt>
<dd class="field-even"><p>The protocol context.</p>
</dd>
</dl>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.main">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">main</code><span class="sig-paren">(</span><span class="sig-paren">)</span> → int<a class="headerlink" href="#opentrons.simulate.main" title="Permalink to this definition">¶</a></dt>
<dd><p>Run the simulation</p>
</dd></dl>
<dl class="function">
<dt id="opentrons.simulate.simulate">
<code class="sig-prename descclassname">opentrons.simulate.</code><code class="sig-name descname">simulate</code><span class="sig-paren">(</span><em class="sig-param">protocol_file: &lt;class 'TextIO'&gt;</em>, <em class="sig-param">file_name: str = None</em>, <em class="sig-param">custom_labware_paths: List[str] = None</em>, <em class="sig-param">custom_data_paths: List[str] = None</em>, <em class="sig-param">propagate_logs: bool = False</em>, <em class="sig-param">hardware_simulator_file_path: str = None</em>, <em class="sig-param">log_level: str = 'warning'</em><span class="sig-paren">)</span> → Tuple[List[Mapping[str, Any]], Union[opentrons.protocols.types.BundleContents, NoneType]]<a class="headerlink" href="#opentrons.simulate.simulate" title="Permalink to this definition">¶</a></dt>
<dd><p>Simulate the protocol itself.</p>
<p>This is a one-stop function to simulate a protocol, whether python or json,
no matter the api version, from external (i.e. not bound up in other
internal server infrastructure) sources.</p>
<p>To simulate an opentrons protocol from other places, pass in a file like
object as protocol_file; this function either returns (if the simulation
has no problems) or raises an exception.</p>
<p>To call from the command line use either the autogenerated entrypoint
<code class="docutils literal notranslate"><span class="pre">opentrons_simulate</span></code> (<code class="docutils literal notranslate"><span class="pre">opentrons_simulate.exe</span></code>, on windows) or
<code class="docutils literal notranslate"><span class="pre">python</span> <span class="pre">-m</span> <span class="pre">opentrons.simulate</span></code>.</p>
<p>The return value is the run log, a list of dicts that represent the
commands executed by the robot; and either the contents of the protocol
that would be required to bundle, or <code class="docutils literal notranslate"><span class="pre">None</span></code>.</p>
<p>Each dict element in the run log has the following keys:</p>
<blockquote>
<div><ul class="simple">
<li><dl class="simple">
<dt><code class="docutils literal notranslate"><span class="pre">level</span></code>: The depth at which this command is nested - if this an</dt><dd><p>aspirate inside a mix inside a transfer, for instance,
it would be 3.</p>
</dd>
</dl>
</li>
<li><dl class="simple">
<dt><code class="docutils literal notranslate"><span class="pre">payload</span></code>: The command, its arguments, and how to format its text.</dt><dd><p>For more specific details see
<code class="xref py py-mod docutils literal notranslate"><span class="pre">opentrons.commands</span></code>. To format a message from
a payload do <code class="docutils literal notranslate"><span class="pre">payload['text'].format(**payload)</span></code>.</p>
</dd>
</dl>
</li>
<li><dl class="simple">
<dt><code class="docutils literal notranslate"><span class="pre">logs</span></code>: Any log messages that occurred during execution of this</dt><dd><p>command, as a logging.LogRecord</p>
</dd>
</dl>
</li>
</ul>
</div></blockquote>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>protocol_file</strong> (<em>file-like</em>) – The protocol file to simulate.</p></li>
<li><p><strong>file_name</strong> (<em>str</em>) – The name of the file</p></li>
<li><p><strong>custom_labware_paths</strong> – A list of directories to search for custom
labware, or None. Ignored if the apiv2 feature
flag is not set. Loads valid labware from
these paths and makes them available to the
protocol context.</p></li>
<li><p><strong>custom_data_paths</strong> – A list of directories or files to load custom
data files from. Ignored if the apiv2 feature
flag if not set. Entries may be either files or
directories. Specified files and the
non-recursive contents of specified directories
are presented by the protocol context in
<code class="xref py py-attr docutils literal notranslate"><span class="pre">ProtocolContext.bundled_data</span></code>.</p></li>
<li><p><strong>hardware_simulator_file_path</strong> – A path to a JSON file defining a
hardware simulator.</p></li>
<li><p><strong>propagate_logs</strong> (<em>bool</em>) – Whether this function should allow logs from the
Opentrons stack to propagate up to the root handler.
This can be useful if you’re integrating this
function in a larger application, but most logs that
occur during protocol simulation are best associated
with the actions in the protocol that cause them.
Default: <code class="docutils literal notranslate"><span class="pre">False</span></code></p></li>
<li><p><strong>log_level</strong> (<em>'debug'</em><em>, </em><em>'info'</em><em>, </em><em>'warning'</em><em>, or </em><em>'error'</em>) – The level of logs to capture in the runlog. Default:
<code class="docutils literal notranslate"><span class="pre">'warning'</span></code></p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>A tuple of a run log for user output, and possibly the required
data to write to a bundle to bundle this protocol. The bundle is
only emitted if bundling is allowed (see
<code class="xref py py-meth docutils literal notranslate"><span class="pre">allow_bundling()</span></code>)  and this is an unbundled Protocol API
v2 python protocol. In other cases it is None.</p>
</dd>
</dl>
</dd></dl>


<span id="protocol-api-deck-coords"></span><h2 id="deck-coordinates">Deck Coordinates<a class="headerlink" href="#deck-coordinates" title="Permalink to this headline">¶</a></h2>
<p>The OT2’s base coordinate system is known as deck coordinates. This coordinate system is referenced frequently through the API. It is a right-handed coordinate system always specified in mm, with <cite>(0, 0, 0)</cite> at the front left of the robot. <cite>+x</cite> is to the right, <cite>+y</cite> is to the back, and <cite>+z</cite> is up.</p>
<p>Note that there are technically two <cite>z</cite> axes, one for each pipette mount. In these terms, <cite>z</cite> is the axis of the left pipette mount and <cite>a</cite> is the axis of the right pipette mount. These are obscured by the API’s habit of defining motion commands on a per-pipette basis; the pipettes internally select the correct <cite>z</cite> axis to move. This is also true of the pipette plunger axes, <cite>b</cite> (left) and <cite>c</cite> (right).</p>
<p>When locations are specified to functions like <a class="reference internal" href="#opentrons.protocol_api.contexts.InstrumentContext.move_to" title="opentrons.protocol_api.contexts.InstrumentContext.move_to"><code class="xref py py-meth docutils literal notranslate"><span class="pre">opentrons.protocol_api.contexts.InstrumentContext.move_to()</span></code></a>, in addition to being an instance of <a class="reference internal" href="#opentrons.protocol_api.labware.Well" title="opentrons.protocol_api.labware.Well"><code class="xref py py-class docutils literal notranslate"><span class="pre">opentrons.protocol_api.labware.Well</span></code></a> they may define coordinates in this deck coordinate space. These coordinates can be specified either as a standard python <code class="xref py py-class docutils literal notranslate"><span class="pre">tuple</span></code> of three floats, or as an instance of the <code class="xref py py-class docutils literal notranslate"><span class="pre">collections.namedtuple</span></code> <a class="reference internal" href="#opentrons.types.Point" title="opentrons.types.Point"><code class="xref py py-class docutils literal notranslate"><span class="pre">opentrons.types.Point</span></code></a>, which can be created in the same way.</p>




</div>