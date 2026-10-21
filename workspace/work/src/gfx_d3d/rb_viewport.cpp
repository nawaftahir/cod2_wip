// Candidate isolated viewport calculation; historical TU grouping is unconfirmed.
#include "r_local.h"
#include "rb_backend.h"

void RB_UpdateViewportConstants()
{
	GfxViewport viewport;
	float renderTargetWidth, renderTargetHeight;
	float invRenderTargetWidth, invRenderTargetHeight;
	float halfViewportWidth, halfViewportHeight;
	float viewportCenterX, viewportCenterY;
	float normalizedViewport[2];

	backEnd.projection2D = 0;
	backEnd.viewportIsDirty = 1;
	renderTargetWidth = (float)dxState.renderTargetWidth;
	invRenderTargetWidth = 1.0f / renderTargetWidth;
	renderTargetHeight = (float)dxState.renderTargetHeight;
	invRenderTargetHeight = 1.0f / renderTargetHeight;
	if (dxState.viewportBehavior == GFX_USE_VIEWPORT_FULL)
	{
		viewport.x = 0;
		viewport.y = 0;
		viewport.width = dxState.renderTargetWidth;
		viewport.height = dxState.renderTargetHeight;
	}
	else
		viewport = backEnd.sceneViewport;
	normalizedViewport[0] = viewport.width * invRenderTargetWidth;
	normalizedViewport[1] = viewport.height * invRenderTargetHeight;
	halfViewportWidth = normalizedViewport[0] * 0.5f;
	halfViewportHeight = normalizedViewport[1] * 0.5f;
	viewportCenterX = viewport.x * invRenderTargetWidth + halfViewportWidth;
	viewportCenterY = viewport.y * invRenderTargetHeight + halfViewportHeight;
	viewportCenterX += invRenderTargetWidth * 0.5f;
	viewportCenterY += invRenderTargetHeight * 0.5f;
	RB_SetCodeConstant(43, renderTargetWidth, renderTargetHeight, invRenderTargetWidth, invRenderTargetHeight);
	RB_SetCodeConstant(46, halfViewportWidth, -halfViewportHeight, 0.0f, 1.0f);
	RB_SetCodeConstant(47, viewportCenterX, viewportCenterY, 0.0f, 0.0f);
}
