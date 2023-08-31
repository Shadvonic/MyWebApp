# Use the official .NET 6.0 SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the project file and restore dependencies
COPY MyWebApp.csproj .
RUN dotnet restore

# Copy the rest of the application code
COPY . .

# Build the application
RUN dotnet build -c Release -o out

# Run the application
CMD ["dotnet", "out/MyWebApp.dll"]
