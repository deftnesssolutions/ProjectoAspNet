USE [MSPantanal]
GO
/****** Object:  Table [dbo].[Vendedores]    Script Date: 05/27/2015 14:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedores](
	[idVendedor] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prevendaDetalhesComplemento]    Script Date: 05/27/2015 14:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prevendaDetalhesComplemento](
	[prevendaLinhaId] [int] NULL,
	[prevendaDetalheTipo] [varchar](1) NULL,
	[prevendaDetalheDescricao] [varchar](48) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prevendaDetalhes]    Script Date: 05/27/2015 14:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prevendaDetalhes](
	[prevendaId] [int] NULL,
	[prevendaProdutoOrdem] [smallint] NULL,
	[prevendaProdutoCodigo] [int] NULL,
	[prevendaProdutoQuantidade] [money] NULL,
	[prevendaProdutoUnitario] [money] NULL,
	[prevendaProdutoSituacao] [smallint] NULL,
	[prevendaProdutoCodigoGtim] [varchar](30) NULL,
	[prevendaLinhaId] [int] IDENTITY(0,1) NOT NULL,
	[prevendaProdutoAtendente] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prevenda]    Script Date: 05/27/2015 14:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prevenda](
	[prevendaID] [int] IDENTITY(1,1) NOT NULL,
	[prevendaCaixa] [int] NULL,
	[prevendaCartao] [int] NULL,
	[prevendaCpFiscal] [int] NULL,
	[prevendaSituacao] [smallint] NULL,
	[prevendaFechada] [smallint] NOT NULL,
	[prevendaData] [datetime] NULL,
	[prevendaNomeCliente] [varchar](50) NULL,
 CONSTRAINT [PK_Prevenda] PRIMARY KEY CLUSTERED 
(
	[prevendaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estoqueBarras]    Script Date: 05/27/2015 14:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estoqueBarras](
	[IdProduto] [int] NOT NULL,
	[codigoBarras] [nvarchar](30) NOT NULL,
	[barrasTipo] [smallint] NULL,
 CONSTRAINT [PK_estoqueBarras] PRIMARY KEY CLUSTERED 
(
	[IdProduto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 05/27/2015 14:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[idProduto] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](70) NULL,
	[preco_venda] [money] NULL,
	[unidade] [nvarchar](6) NULL,
	[produtoRequerProducao] [bit] NULL,
	[produtoRequerProducaoPermiteAlterar] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Prevenda_prevendaFechada]    Script Date: 05/27/2015 14:34:26 ******/
ALTER TABLE [dbo].[Prevenda] ADD  CONSTRAINT [DF_Prevenda_prevendaFechada]  DEFAULT ((0)) FOR [prevendaFechada]
GO
