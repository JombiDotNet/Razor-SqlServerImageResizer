CREATE TABLE [ImageFile](
	[ImageFileId] [int] IDENTITY(1,1) NOT NULL,
	[ImageGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Media_ImageFile_ImageGuid]  DEFAULT (newid()),
	[FileExtension] [nvarchar](15) NULL,
	[ImageFormat] [nvarchar](15) NULL,
	[SourcePath] [nvarchar](256) NOT NULL,
	[ImageContents] [image] NULL,
	[FileSize] [numeric](8, 0) NOT NULL,
	[FileSizeKb]  AS (round([FileSize]/(1024),(2))),
	[FileSizeMb]  AS (round([FileSize]/(1048576),(2))),
	[ImageWidth] [int] NOT NULL,
	[ImageHeight] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL CONSTRAINT [DF_Media_ImageFile_UploadDate]  DEFAULT (getdate()),
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ImageFile] PRIMARY KEY CLUSTERED 
(
	[ImageFileId] ASC
)
)
GO