namespace NetCoreConsoleApp
{
    class Program
    {
        private static void Main()
        {
            var app = new App(new ConsoleInputPort(), new ConsoleOutputPort());
            app.Run();
        }
    }
}
