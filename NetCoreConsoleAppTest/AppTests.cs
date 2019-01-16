using System;
using Moq;
using NetCoreConsoleApp;
using Xunit;

namespace NetCoreConsoleAppTest
{
    public class AppTests
    {
        [Fact]
        public void Run_CallsInputPortAndOutputPort()
        {
            // Arrange
            var inputPortMock = new Mock<IInputPort>();
            var outputPortMock = new Mock<IOutputPort>();
            var app = new App(inputPortMock.Object, outputPortMock.Object);

            // Act
            app.Run();

            // Assert
            inputPortMock.Verify(m => m.ReadLine(), Times.Once);
            outputPortMock.Verify(m => m.WriteLine("Hello World!"), Times.Once);
            outputPortMock.Verify(m => m.WriteLine("Press ENTER to quit."), Times.Once);
        }
    }
}
