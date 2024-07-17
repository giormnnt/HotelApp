/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
if not exists (SELECT 1 FROM dbo.RoomTypes)
begin
    INSERT INTO dbo.RoomTypes(Title, Description, Price)
    VALUES ('King Size Bed', 'A comfortable room and a balcony with a king-size bed.', 10000),
    ('Three Queen Size Beds', 'A comfortable room with queen-size bed that is great with friends or family.', 15000),
    ('VIP Member','For VIP Members only, it has mini-pool with two king-size bed.', 30000);
end

if not exists (SELECT 1 FROM dbo.Rooms)
begin
    DECLARE @roomId1 int;
    DECLARE @roomId2 int;
    DECLARE @roomId3 int;

    SELECT @roomId1 = Id from dbo.RoomTypes WHERE Title = 'King Size Bed';
    SELECT @roomId2 = Id from dbo.RoomTypes WHERE Title = 'Three Queen Size Beds';
    SELECT @roomId3 = Id from dbo.RoomTypes WHERE Title = 'VIP Member';

    INSERT INTO dbo.Rooms(RoomNumber, RoomTypeId)
    VALUES ('101', @roomId1),
    ('102', @roomId1),
    ('103', @roomId3),
    ('201', @roomId2),
    ('202', @roomId1),
    ('203', @roomId2);
end