namespace NetCoreConsoleApp
{
    public class App
    {
        private readonly IInputPort _inputPort;
        private readonly IOutputPort _outputPort;

        public App(IInputPort inputPort, IOutputPort outputPort)
        {
            _inputPort = inputPort;
            _outputPort = outputPort;
        }

        public void Run()
        {
            _outputPort.WriteLine("Hello World!");
            _outputPort.WriteLine("Press ENTER to quit.");
            _inputPort.ReadLine();
        }
    }
}