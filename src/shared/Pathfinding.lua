local PathfindingService = game:GetService("PathfindingService")



local Pathfinding = { }

function Pathfinding.FollowPath(waypoints, character)

	local humanoid = character:FindFirstChild("Humanoid")
	local animator = humanoid:FindFirstChild("Animator")

	local walkAnimation
	local animationTrack

	if character:FindFirstChild("Animate") and animator then
		walkAnimation = character.Animate.walk.WalkAnim
		animationTrack = animator:LoadAnimation(walkAnimation)
		animationTrack:Play()
	end

	for waypoint = 1, #waypoints:GetChildren() do
		humanoid:MoveTo(waypoints[waypoint].Position)
		humanoid.MoveToFinished:Wait()
	end

	if not animationTrack then return end

	animationTrack:Stop()
end

return Pathfinding