//------------------------------------------------------------------------------
// <auto-generated>                                                             
//     This code was generated by a tool.                                       
//     Changes to this file may cause incorrect behavior and will be lost if    
//     the code is regenerated.                                                 
// </auto-generated>                                                            
//------------------------------------------------------------------------------
namespace BellStates
{
    using System;
    using Microsoft.Quantum.Core;
    using Microsoft.Quantum.Intrinsic;
    using Microsoft.Quantum.Simulation.Core;

    internal class __QsEntryPoint__ : Microsoft.Quantum.EntryPointDriver.IEntryPoint<(Int64,Result), (Int64,Int64,Int64)>
    {
        public string Summary => "";
        public System.Collections.Generic.IEnumerable<System.CommandLine.Option> Options => new System.CommandLine.Option[] { Microsoft.Quantum.EntryPointDriver.Options.CreateOption<Int64>("--" + System.CommandLine.Parsing.StringExtensions.ToKebabCase("count"), ""), Microsoft.Quantum.EntryPointDriver.Options.CreateOption<Result>("--" + System.CommandLine.Parsing.StringExtensions.ToKebabCase("initial"), "") };
        public string DefaultSimulatorName => "QuantumSimulator";
        public string DefaultExecutionTarget => "Any";
        public EntryPointInfo<(Int64,Result), (Int64,Int64,Int64)> Info => global::BellStates.testBellState.Info;
        public IOperationFactory CreateDefaultCustomSimulator() => throw new InvalidOperationException();
        public (Int64,Result) CreateArgument(System.CommandLine.Parsing.ParseResult parseResult) => (parseResult.ValueForOption<Int64>("--" + System.CommandLine.Parsing.StringExtensions.ToKebabCase("count")), parseResult.ValueForOption<Result>("--" + System.CommandLine.Parsing.StringExtensions.ToKebabCase("initial")));
        private static async System.Threading.Tasks.Task<int> Main(string[] args) => await new Microsoft.Quantum.EntryPointDriver.Driver<global::BellStates.testBellState, (Int64,Result), (Int64,Int64,Int64)>(new Microsoft.Quantum.EntryPointDriver.DriverSettings(simulatorOptionAliases: System.Collections.Immutable.ImmutableList.Create("--simulator", "-s"), quantumSimulatorName: "QuantumSimulator", toffoliSimulatorName: "ToffoliSimulator", resourcesEstimatorName: "ResourcesEstimator"), new __QsEntryPoint__()).Run(args);
    }
}